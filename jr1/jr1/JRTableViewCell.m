//
//  JRTableViewCell.m
//  jr1
//
//  Created by simao on 15/11/28.
//  Copyright © 2015年 simao. All rights reserved.
//

#import "JRTableViewCell.h"

@implementation JRTableViewCell


//- (instancetype)initWithFrame:(CGRect)frame {
//    UIView *view = [[UIView alloc] initWithFrame:frame];
//    self.dateLable.frame = CGRectMake(10, 0, 50, 20);
//    self.numLable.frame = CGRectMake(view.frame.size.width/4 + 10, 0, 50, 20);
//    self.amountLable.frame = CGRectMake(view.frame.size.width/2 + 10, 0, 50, 20);
//    self.rateLable.frame = CGRectMake(3*view.frame.size.width/4 + 10, 0, 50, 20);
//    return view;
//}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {
    [_dateLable release];
    [_numLable release];
    [_amountLable release];
    [_rateLable release];
    [super dealloc];
}
@end
