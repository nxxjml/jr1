//
//  JRTableViewCell.h
//  jr1
//
//  Created by simao on 15/11/28.
//  Copyright © 2015年 simao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JRTableViewCell : UITableViewCell
#pragma mark 单元格高度
@property (assign, nonatomic) CGFloat height;
@property (retain, nonatomic) IBOutlet UILabel *dateLable;
@property (retain, nonatomic) IBOutlet UILabel *numLable;
@property (retain, nonatomic) IBOutlet UILabel *amountLable;
@property (retain, nonatomic) IBOutlet UILabel *rateLable;


@end
