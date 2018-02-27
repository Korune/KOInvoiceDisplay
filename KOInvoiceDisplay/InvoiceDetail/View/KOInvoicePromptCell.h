//
//  KOInvoicePromptCell.h
//  KOInvoiceDisplay
//
//  Created by Korune on 2017/12/3.
//  Copyright © 2017年 Korune. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KOInvoicePrompt;

@interface KOInvoicePromptCell : UITableViewCell

@property (nonatomic, strong) KOInvoicePrompt *prompt;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
