//
//  KOInvoiceDetailCell.m
//  KOInvoiceDisplay
//
//  Created by Korune on 2017/12/3.
//  Copyright © 2017年 Korune. All rights reserved.
//

#import "KOInvoiceDetailCell.h"
#import "KOInvoiceConst.h"
#import "KOInvoiceTableHeaderView.h"
#import "KOInvoiceInfo.h"

@interface KOInvoiceDetailCell ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) UITableView *tableView;

@end

@implementation KOInvoiceDetailCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
   NSString *cellIdentifier = NSStringFromClass([KOInvoiceDetailCell class]);
   KOInvoiceDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[KOInvoiceDetailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupChildViews];
    }
    return self;
}

- (void)setFrame:(CGRect)frame // 让单元格上左右有间距。 ⛔️ 不是重写 - layoutSubviews 方法。
{
    frame.origin.x = kInvoicePaddingH;
    frame.origin.y += kInvoicePaddingV; // y 计算不是后面代码，会计算错误：frame.origin.y = kInvoicePaddingV;
    frame.size.width = frame.size.width - kInvoicePaddingH * 2; // 宽度计算不是后面代码，会计算错误：frame.size.width = self.frame.size.width - kInvoicePaddingH * 2;
    frame.size.height = frame.size.height - kInvoicePaddingV; // 宽度计算不是后面代码，会计算错误：frame.size.height = self.frame.size.height - kInvoicePaddingV;
    
    [super setFrame:frame];
}

- (void)setupChildViews
{
    UITableView *tableView = [[UITableView alloc] init];
    tableView.delegate = self;
    tableView.dataSource = self;
    self.tableView = tableView;
    [self.contentView addSubview:tableView];
}

- (void)setInvoceInfo:(KOInvoiceInfo *)invoceInfo
{
    _invoceInfo = invoceInfo;
    
    KOInvoiceTableHeaderView *headerView = [[KOInvoiceTableHeaderView alloc] init];
    headerView.invoiceInfo = invoceInfo;
    headerView.frame = invoceInfo.detailCellTableHeaderViewFrame;
    self.tableView.tableHeaderView = headerView;
   
    self.tableView.frame = invoceInfo.detailCellTableViewFrame;
}

#pragma mark - UITableViewDataSource 方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    return cell;
}

#pragma mark UITableViewDelegate

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}

@end
