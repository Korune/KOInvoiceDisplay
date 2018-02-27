//
//  KOInvoicePrompt.m
//  KOInvoiceDisplay
//
//  Created by Korune on 2017/12/3.
//  Copyright © 2017年 Korune. All rights reserved.
//

#import "KOInvoicePrompt.h"
#import "KOInvoiceConst.h"

@interface KOInvoicePrompt ()

@property (nonatomic, readwrite) CGRect labelFrame;
@property (nonatomic, readwrite) CGFloat cellHeight;

@end

@implementation KOInvoicePrompt

- (CGFloat)cellHeight
{
    if (!_cellHeight) {
        CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
        CGFloat labelW = screenW - kInvoicePaddingH * 4;
        CGSize maxSize = CGSizeMake(labelW, MAXFLOAT);
        NSDictionary *attributes =@{
                                    NSFontAttributeName : [UIFont systemFontOfSize:kInvoiceSystemFontSize]
                                    };
       CGFloat labelH = [_prompt boundingRectWithSize:maxSize
                                              options:NSStringDrawingUsesLineFragmentOrigin
                                           attributes:attributes
                                              context:nil].size.height;
        self.labelFrame = CGRectMake(kInvoicePaddingH, kInvoicePaddingV, labelW, labelH);
        _cellHeight = CGRectGetMaxY(self.labelFrame) + kInvoicePaddingV + kInvoicePaddingV;  // ⛔️ 多加的一个 kInvoicePaddingV 是 cell 高度减少的高度
    }                                                                                                                          
    return _cellHeight;
}

@end
