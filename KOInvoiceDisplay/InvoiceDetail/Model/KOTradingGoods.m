//
//  KOTradingGoods.m
//  KOInvoiceDisplay
//
//  Created by Korune on 2017/12/3.
//  Copyright © 2017年 Korune. All rights reserved.
//

#import "KOTradingGoods.h"

@implementation KOTradingGoods

- (instancetype)initWithName:(NSString *)name
                amountString:(NSString *)amountString
{
    if (self = [super init]) {
        self.name = name;
        self.amountString = amountString;
    }
    return self;
}

@end
