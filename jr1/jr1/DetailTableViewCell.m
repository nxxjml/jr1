//
//  DetailTableViewCell.m
//  jr1
//
//  Created by simao on 15/12/2.
//  Copyright © 2015年 simao. All rights reserved.
//

#import "DetailTableViewCell.h"

@implementation DetailTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.mLabel = [[UILabel alloc] init];
        self.mLabel.font = [UIFont systemFontOfSize:14];
        CGSize lLabelSize = [_lLabel.text sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:14]}];
//        self.mLabel.frame = CGRectMake(15, (self.frame.size.height - ceil(lLabelSize.height))/2, ceil(lLabelSize.width), ceil(lLabelSize.height));
        self.mLabel.frame = CGRectMake(15, (self.frame.size.height - ceil(lLabelSize.height))/2, 115, ceil(lLabelSize.height));
        [self.contentView addSubview:self.lLabel];
        
        self.mLabel = [[UILabel alloc] init];
        self.mLabel.font = [UIFont systemFontOfSize:14];
        self.mLabel.frame = CGRectMake(130, (self.frame.size.height - ceil(lLabelSize.height))/2, 115, ceil(lLabelSize.height));
        [self.contentView addSubview:self.mLabel];
        
        self.rLabel = [[UILabel alloc] init];
        self.rLabel.font = [UIFont systemFontOfSize:14];
        self.rLabel.frame = CGRectMake(245, (self.frame.size.height - ceil(lLabelSize.height))/2, 115, ceil(lLabelSize.height));
        [self.contentView addSubview:self.rLabel];
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
