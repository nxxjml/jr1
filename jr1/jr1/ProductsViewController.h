//
//  ProductsViewController.h
//  jr1
//
//  Created by simao on 15/12/1.
//  Copyright © 2015年 simao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductTableViewCell.h"
#import "ProductDetialsViewController.h"


@interface ProductsViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
@property (retain, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray * productsItemArray;

@end
