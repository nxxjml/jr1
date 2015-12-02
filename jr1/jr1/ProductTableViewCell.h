//
//  ProductTableViewCell.h
//  jr1
//
//  Created by simao on 15/12/1.
//  Copyright © 2015年 simao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductTableViewCell : UITableViewCell
@property (retain, nonatomic) IBOutlet UILabel *expectedRevenue;
@property (retain, nonatomic) IBOutlet UILabel *expectedRevenueData;
@property (retain, nonatomic) IBOutlet UILabel *minimumAmount;
@property (retain, nonatomic) IBOutlet UILabel *minimumAmountData;
@property (retain, nonatomic) IBOutlet UILabel *lockUpPeriod;
@property (retain, nonatomic) IBOutlet UILabel *lockUpPeriodData;
@property (retain, nonatomic) IBOutlet UIButton *applyInvestBtn;


@end
