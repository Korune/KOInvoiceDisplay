//
//  KOInvoicePrompt.h
//  KOInvoiceDisplay
//
//  Created by Korune on 2017/12/3.
//  Copyright © 2017年 Korune. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KOInvoicePrompt : NSObject

@property (nonatomic, copy) NSString *prompt;
@property (nonatomic, readonly) CGRect labelFrame;
@property (nonatomic, readonly) CGFloat cellHeight;

@end
