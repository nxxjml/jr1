//
//  PCViewController.h
//  jr1
//
//  Created by simao on 15/11/28.
//  Copyright © 2015年 simao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PcDetailsViewController.h"



@interface PCViewController : UIViewController<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate, NSURLConnectionDataDelegate>

@property(nonatomic, strong) UIScrollView *scrollView;
@property(nonatomic, strong) UITableView *tableView;

@end
