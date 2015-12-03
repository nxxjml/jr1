//
//  ProductDetialsViewController.h
//  jr1
//
//  Created by simao on 15/12/1.
//  Copyright © 2015年 simao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailTableViewCell.h"

@interface ProductDetialsViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
@property (retain, nonatomic) UITextField *investAmoutTextField;

@end
