//
//  KOInvoiceInfo.h
//  KOInvoiceDisplay
//
//  Created by Korune on 2017/12/3.
//  Copyright © 2017年 Korune. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KOTradingGoods;
@class KOInvoiceSectionItem;

@interface KOInvoiceInfo : NSObject

/** 发票标题 */
@property (nonatomic, copy) NSString *invoiceTitle;
/** 买方账号 */
@property (nonatomic, copy) NSString *buyerNumber;
/** 买方名字 */
@property (nonatomic, copy) NSString *buyerName;
/** 卖方账号 */
@property (nonatomic, copy) NSString *sellerNumber;
/** 卖方名字 */
@property (nonatomic, copy) NSString *sellerName;

@property (nonatomic, copy) NSString *tradingTimeString;
/** 交易网点 */
@property (nonatomic, copy) NSString *tradingBranch;
/** 交易金额 */
@property (nonatomic, copy) NSString *tradingAmount;
/** 交易物品 */
@property (nonatomic, strong) NSArray<KOTradingGoods *> *tradingGoods;
/** 附言 */
@property (nonatomic, copy) NSString *postscript;
/** 提示信息 */
@property (nonatomic, copy) NSString *prompt;

// 辅助属性

@property (nonatomic, readonly) CGFloat detailCellHeight;
@property (nonatomic, readonly) CGRect detailCellTableViewFrame;
@property (nonatomic, readonly) CGFloat detailCellTableHeaderViewHeight;
@property (nonatomic, readonly) CGRect detailCellTableHeaderViewTitleLabelFrame;
@property (nonatomic, readonly) CGRect detailCellTableHeaderViewFrame;

@property (nonatomic, strong) NSArray<KOInvoiceSectionItem *> *sectionItems;


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
                                     prompt:(NSString *)prompt;

@end
