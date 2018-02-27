//
//  KOInvoiceSectionItem.h
//  KOInvoiceDisplay
//
//  Created by Korune on 2017/12/21.
//  Copyright © 2017年 Korune. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KOInvoiceSectionItem : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *detail;
@property (nonatomic, readonly) CGFloat sectionHeaderViewHeight;
@property (nonatomic, readonly) CGRect sectionHeaderViewLeftStringFrame;
@property (nonatomic, readonly) CGRect sectionHeaderViewRightStringFrame;
@property (nonatomic, readonly) CGRect sectionHeaderViewArrowButtonStringFrame;
@property (nonatomic, readonly) CGRect sectionHeaderViewFrame;

@property (nonatomic) BOOL isCellOpened;

@end
