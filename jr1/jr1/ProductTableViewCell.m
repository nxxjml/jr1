//
//  ProductTableViewCell.m
//  jr1
//
//  Created by simao on 15/12/1.
//  Copyright © 2015年 simao. All rights reserved.
//

#import "ProductTableViewCell.h"

@implementation ProductTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {
    [_expectedRevenue release];
    [_expectedRevenueData release];
    [_minimumAmount release];
    [_minimumAmountData release];
    [_lockUpPeriod release];
    [_lockUpPeriodData release];
    [_applyInvestBtn release];
    [super dealloc];
}
@end
