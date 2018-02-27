//
//  KOInvoiceDetailCell.h
//  KOInvoiceDisplay
//
//  Created by Korune on 2017/12/3.
//  Copyright © 2017年 Korune. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KOInvoiceInfo;

@interface KOInvoiceDetailCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;
@property (nonatomic, strong) KOInvoiceInfo *invoceInfo;

@end
