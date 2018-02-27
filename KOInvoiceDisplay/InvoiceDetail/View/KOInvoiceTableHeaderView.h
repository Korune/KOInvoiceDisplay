//
//  KOInvoiceTableHeaderView.h
//  KOInvoiceDisplay
//
//  Created by Korune on 2017/12/17.
//  Copyright © 2017年 Korune. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KOInvoiceInfo;

@interface KOInvoiceTableHeaderView : UIView

@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) KOInvoiceInfo *invoiceInfo;

@end
