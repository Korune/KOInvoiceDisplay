//
//  KOTradingGoods.h
//  KOInvoiceDisplay
//
//  Created by Korune on 2017/12/3.
//  Copyright © 2017年 Korune. All rights reserved.
//

#import <Foundation/Foundation.h>

/** 交易物品 */
@interface KOTradingGoods : NSObject

@property (nonatomic, copy) NSString *name;
/** 数量 */
@property (nonatomic, copy) NSString *amountString;

- (instancetype)initWithName:(NSString *)name
                amountString:(NSString *)amountString;

@end
