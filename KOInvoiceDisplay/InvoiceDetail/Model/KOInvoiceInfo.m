//
//  KOInvoiceInfo.m
//  KOInvoiceDisplay
//
//  Created by Korune on 2017/12/3.
//  Copyright © 2017年 Korune. All rights reserved.
//

#import "KOInvoiceInfo.h"
#import "KOTradingGoods.h"
#import "KOInvoiceConst.h"
#import "KOInvoiceSectionItem.h"

@interface KOInvoiceInfo ()

@property (nonatomic, readwrite) CGFloat detailCellHeight;
@property (nonatomic, readwrite) CGRect detailCellTableViewFrame;
@property (nonatomic, readwrite) CGFloat detailCellTableHeaderViewHeight;
@property (nonatomic, readwrite) CGRect detailCellTableHeaderViewTitleLabelFrame;
@property (nonatomic, readwrite) CGRect detailCellTableHeaderViewFrame;

@end

@implementation KOInvoiceInfo

- (instancetype)initWithTradingInvoiceTitle:(NSString *)invoiceTitle
                                buyerNumber:(NSString *)buyerNumber
                                  buyerName:(NSString *)buyerName
                               sellerNumber:(NSString *)sellerNumber
                                 sellerName:(NSString *)sellerName
                                 timeString:(NSString *)tradingTimeString
                              tradingBranch:(NSString *)tradingBranch
                              tradingAmount:(NSString *)tradingAmount
                               tradingGoods:(NSArray<KOTradingGoods *> *)tradingGoods
                                 postscript:(NSString *)postscript
                                     prompt:(NSString *)prompt
{
    if (self = [super init]) {
        
        self.invoiceTitle = invoiceTitle;
        self.buyerNumber = buyerNumber;
        self.buyerName = buyerName;
        self.sellerNumber = sellerNumber;
        self.sellerName = sellerName;
        self.tradingTimeString = tradingTimeString;
        self.tradingBranch = tradingBranch;
        self.tradingAmount = tradingAmount;
        self.tradingGoods = tradingGoods;
        self.postscript = postscript;
        self.prompt =  prompt;
    }
    return self;
}

- (CGFloat)detailCellHeight
{
    if (!_detailCellHeight) {
        
        CGFloat height = 0;
        for (KOInvoiceSectionItem *sectionItem in self.sectionItems) {
            height += sectionItem.sectionHeaderViewHeight;
        }
        _detailCellHeight = height + self.detailCellTableHeaderViewHeight + kInvoicePaddingV; // 多 kInvoicePaddingV 为 cell 高度减少的高度
        
        CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
        CGFloat tableViewW = screenW - kInvoicePaddingH * 2;
        _detailCellTableViewFrame = CGRectMake(0, 0, tableViewW, _detailCellHeight);
    }
    return _detailCellHeight;
}

- (CGFloat)detailCellTableHeaderViewHeight
{
    if (!_detailCellTableHeaderViewHeight) {
        
        CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
        CGFloat labelW = screenW - kInvoicePaddingH * 4;
        CGSize maxSize = CGSizeMake(labelW, MAXFLOAT);
        NSDictionary *attributes = @{
                                     NSFontAttributeName : [UIFont systemFontOfSize:kInvoiceSystemFontSize]
                                     };
        
        CGFloat labelH = [_invoiceTitle boundingRectWithSize:maxSize
                                                     options:NSStringDrawingUsesLineFragmentOrigin
                                                  attributes:attributes
                                                     context:nil].size.height;
        _detailCellTableHeaderViewTitleLabelFrame = CGRectMake(kInvoicePaddingH, kInvoicePaddingV, labelW, labelH);
        
        CGFloat headerViewW = screenW - kInvoicePaddingH * 2;
        CGFloat headerViewH = labelH + kInvoicePaddingV * 2;
        _detailCellTableHeaderViewFrame = CGRectMake(0, 0, headerViewW, headerViewH);
        _detailCellTableHeaderViewHeight = headerViewH;
    }
    return _detailCellTableHeaderViewHeight;
}

@end
