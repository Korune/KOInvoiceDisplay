//
//  KOInvoiceDetailController.m
//  KOInvoiceDisplay
//
//  Created by Korune on 2017/12/3.
//  Copyright © 2017年 Korune. All rights reserved.
//

#import "KOInvoiceDetailController.h"
#import "KOInvoiceDetailCell.h"
#import "KOInvoicePromptCell.h"
#import "KOInvoiceInfo.h"
#import "KOInvoicePrompt.h"
#import "KOInvoiceTableHeaderView.h"

@interface KOInvoiceDetailController ()

/** 第二个 cell 的模型 */
@property (nonatomic, strong) KOInvoicePrompt *invoicePrompt;
@property (nonatomic, strong) NSMutableArray *data;

@end

@implementation KOInvoiceDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"发票详情";
    self.tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];;
    self.tableView.estimatedRowHeight = 0;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    KOInvoiceTableHeaderView *tableHeaderView = [[KOInvoiceTableHeaderView alloc] init];
    self.tableView.tableHeaderView = tableHeaderView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -

- (NSMutableArray *)data
{
    if (!_data) {
       _data = [NSMutableArray arrayWithArray:@[
                                                self.invoiceInfo,
                                                self.invoicePrompt
                                                ]];
    }
    return _data;
}

- (void)setInvoiceInfo:(KOInvoiceInfo *)invoiceInfo
{
    _invoiceInfo = invoiceInfo;
    
    _invoicePrompt = [[KOInvoicePrompt alloc] init];
    _invoicePrompt.prompt = invoiceInfo.prompt;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = nil;
    NSObject *object = self.data[indexPath.row];
    if ([object isKindOfClass:[KOInvoiceInfo class]]) {
        cell = [KOInvoiceDetailCell cellWithTableView:tableView];
        ((KOInvoiceDetailCell *)cell).invoceInfo = self.invoiceInfo;
    } else if ([object isKindOfClass:[KOInvoicePrompt class]]) {
        cell = [KOInvoicePromptCell cellWithTableView:tableView];
        ((KOInvoicePromptCell *)cell).prompt = self.invoicePrompt;
    }
    cell.layer.cornerRadius = 10;
    cell.layer.masksToBounds = YES;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

#pragma mark tableViewDelegate 方法

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSObject *object = self.data[indexPath.row];
    if ([object isKindOfClass:[KOInvoiceInfo class]]) {
        return self.invoiceInfo.detailCellHeight;
    } else if ([object isKindOfClass:[KOInvoicePrompt class]]) {
        return self.invoicePrompt.cellHeight;
    }
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
}

@end
