//
//  ViewController.m
//  KOInvoiceDisplay
//
//  Created by Korune on 2017/11/29.
//  Copyright © 2017年 Korune. All rights reserved.
//

#import "ViewController.h"
#import "KOInvoiceDetailController.h"
#import "KOInvoiceInfo.h"
#import "KOTradingGoods.h"

@interface ViewController ()

@property (nonatomic, strong) KOInvoiceInfo *invoiceInfo;

- (IBAction)buttonOnClicked:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 进行网络请求
    // 字典转模型
}

- (KOInvoiceInfo *)invoiceInfo
{
    // 一般情况是获取模型是，进行 http 请求获取发票信息，然后字典转模型。这里直接设置模型属性
    if (!_invoiceInfo) {
        KOTradingGoods *tradingGoods1 = [[KOTradingGoods alloc] initWithName:@"叛逆大剑" amountString:@"1把"];
        KOTradingGoods *tradingGoods2 = [[KOTradingGoods alloc] initWithName:@"银鳞胸甲（蓝色品质）" amountString:@"1件"];
        NSArray *tradingGoods = @[tradingGoods1, tradingGoods2];
        
        _invoiceInfo =
        [[KOInvoiceInfo alloc] initWithTradingInvoiceTitle:@"超神学院交易发票"
                                               buyerNumber:@"杀手47"
                                                 buyerName:@"大盖伦"
                                              sellerNumber:@"3.141592654"
                                                sellerName:@"洛克萨斯之手——德莱厄斯"
                                                timeString:@"25th of Hearthfire, 4E 201（第4纪元201年炉火月25日）"
                                             tradingBranch:@"天际省雪漫城杂货铺行会支部"
                                             tradingAmount:@"9000欧比斯"
                                              tradingGoods:tradingGoods
                                                postscript:@"I Used To Be An Adventurer Like You, Then I Took An Arrow In The Knee.（我以前跟你一样是个冒险者，直到我的膝盖中了一箭）"
                                                    prompt:@"温馨提示：已受理你的交易请求，此发票仅供查阅使用。"];
    }
    
    return _invoiceInfo;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)buttonOnClicked:(id)sender {
    
    KOInvoiceDetailController *invoiceDetailControlller = [[KOInvoiceDetailController alloc] init];
    invoiceDetailControlller.invoiceInfo = self.invoiceInfo;
    [self.navigationController pushViewController:invoiceDetailControlller animated:YES];
}
@end
