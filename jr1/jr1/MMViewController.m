//
//  MMViewController.m
//  jr1
//
//  Created by simao on 15/11/28.
//  Copyright © 2015年 simao. All rights reserved.
//

#import "MMViewController.h"

@interface MMViewController ()

@end

@implementation MMViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
#pragma mark image
    UIImage *image = [UIImage imageNamed:@"mmjh.png"];
    if (image != nil) {
        NSLog(@"Image load successfully");
    }
    UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height - 100)];
    imageView1.contentMode = UIViewContentModeScaleAspectFit;
    imageView1.image = image;
    [self.view addSubview:imageView1];
    //[self.view setBackgroundColor:[UIColor colorWithPatternImage:image]];
    UIButton *viewBtn = [[UIButton alloc] initWithFrame:CGRectMake(50, self.view.frame.size.height - 100, 100, 20)];
    UIButton *recordsBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 150, self.view.frame.size.height - 100, 100, 20)];
    UIColor *lightBlueColor = [UIColor colorWithRed:0 green:0 blue:0.98 alpha:0.9];
    viewBtn.backgroundColor = lightBlueColor;
    recordsBtn.backgroundColor = lightBlueColor;
    [viewBtn setTitle:@"浏览产品" forState:UIControlStateNormal];
    [recordsBtn setTitle:@"交易记录" forState:UIControlStateNormal];
    [viewBtn sizeToFit];
    [recordsBtn sizeToFit];
    CGRect vframe = viewBtn.frame;
    vframe.size.height = 20;
    viewBtn.frame = vframe;
    CGRect rframe = recordsBtn.frame;
    rframe.size.height = 20;
    recordsBtn.frame = rframe;
    
    
    
    [self.view addSubview:viewBtn];
    [self.view addSubview:recordsBtn];
    
    [viewBtn addTarget:self action:@selector(showProductsView:) forControlEvents:UIControlEventTouchUpInside];
    [recordsBtn addTarget:self action:@selector(showRecordsView:) forControlEvents:UIControlEventTouchUpInside];
    
}


- (void)showProductsView:(id)sender {
//    UIButton *btn = (UIButton*) sender;
    [self performSegueWithIdentifier:@"showProducts" sender:sender];
}

- (void)showRecordsView:(id)sender {
    [self performSegueWithIdentifier:@"showRecords" sender:sender];
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
