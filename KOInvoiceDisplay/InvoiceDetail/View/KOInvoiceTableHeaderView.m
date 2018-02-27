//
//  KOInvoiceTableHeaderView.m
//  KOInvoiceDisplay
//
//  Created by Korune on 2017/12/17.
//  Copyright © 2017年 Korune. All rights reserved.
//

#import "KOInvoiceTableHeaderView.h"
#import "KOInvoiceInfo.h"
#import "KOInvoiceConst.h"

@interface KOInvoiceTableHeaderView ()

@property (nonatomic, weak) UILabel *titleLabel;

@end

@implementation KOInvoiceTableHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupChildViews];
    }
    return self;
}

- (void)setupChildViews
{
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont systemFontOfSize:kInvoiceSystemFontSize];
    
    self.titleLabel = titleLabel;
    [self addSubview:titleLabel];
}

- (void)setInvoiceInfo:(KOInvoiceInfo *)invoiceInfo
{
    _invoiceInfo = invoiceInfo;
    
    self.titleLabel.text = invoiceInfo.invoiceTitle;
    self.titleLabel.frame = invoiceInfo.detailCellTableHeaderViewTitleLabelFrame;
}
@end
