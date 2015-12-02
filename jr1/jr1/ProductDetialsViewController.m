//
//  ProductDetialsViewController.m
//  jr1
//
//  Created by simao on 15/12/1.
//  Copyright © 2015年 simao. All rights reserved.
//

#import "ProductDetialsViewController.h"

@interface ProductDetialsViewController ()

@end

@implementation ProductDetialsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 + 60, 20,120, 10)];
    label.text = @"This is detial viewcontroller";
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
