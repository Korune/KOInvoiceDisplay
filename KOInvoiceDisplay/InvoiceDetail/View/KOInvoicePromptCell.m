//
//  KOInvoicePromptCell.m
//  KOInvoiceDisplay
//
//  Created by Korune on 2017/12/3.
//  Copyright © 2017年 Korune. All rights reserved.
//

#import "KOInvoicePromptCell.h"
#import "KOInvoicePrompt.h"
#import "KOInvoiceConst.h"

@interface KOInvoicePromptCell()

@property (nonatomic, weak) UILabel *label;

@end

@implementation KOInvoicePromptCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    NSString *cellIdentifier = NSStringFromClass([KOInvoicePromptCell class]);
    KOInvoicePromptCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[KOInvoicePromptCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupChildViews];
    }
    return self;
}

- (void)setFrame:(CGRect)frame // 让单元格上左右有间距。 ⛔️ 不是重写 - layoutSubviews 方法。
{
    frame.origin.x = kInvoicePaddingH;
    frame.origin.y += kInvoicePaddingV; // y 计算不是后面代码，会计算错误：frame.origin.y = kInvoicePaddingV;
    frame.size.width = frame.size.width - kInvoicePaddingH * 2; // 宽度计算不是后面代码，会计算错误：frame.size.width = self.frame.size.width - kInvoicePaddingH * 2;
    frame.size.height = frame.size.height - kInvoicePaddingV; // 宽度计算不是后面代码，会计算错误：frame.size.height = self.frame.size.height - kInvoicePaddingV;

    [super setFrame:frame];
}

- (void)setupChildViews
{
    UILabel *label = [[UILabel alloc] init];
    label.numberOfLines= 0;
    label.font = [UIFont systemFontOfSize:kInvoiceSystemFontSize]; // ⛔️ label 需要设置字体，模型中的计算的 labelFrame 是指定了字体大小计算的。如果不设置则 label 使用系统默认字体大小，实际显示的效果，就会与预期的不一致
    self.label = label;
    [self.contentView addSubview:label];
}

- (void)setPrompt:(KOInvoicePrompt *)prompt
{
    _prompt = prompt;
    
    _label.text = prompt.prompt;
    _label.frame = prompt.labelFrame;
}

@end
