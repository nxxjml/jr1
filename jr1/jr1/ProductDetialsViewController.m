//
//  ProductDetialsViewController.m
//  jr1
//
//  Created by simao on 15/12/1.
//  Copyright © 2015年 simao. All rights reserved.
//

#import "ProductDetialsViewController.h"

@interface ProductDetialsViewController ()
@property (retain, nonatomic) NSArray *viewArray;

@end

@implementation ProductDetialsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 60, 68,120, 40)];
    NSString *labelText = @"This is detial viewcontroller";
    label.text = labelText;
//    [label setBackgroundColor:[UIColor lightGrayColor]];
//    [label sizeToFit];
    CGSize labelSize = {0, 0};
//    labelSize = [labelText sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]}];
#pragma mark UILabel自动换行
     labelSize = [labelText boundingRectWithSize:CGSizeMake(120, 500) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:17]} context:nil].size;
    NSLog(@"w=%f,h=%f", labelSize.width, labelSize.height);
    label.frame = CGRectMake(label.frame.origin.x, label.frame.origin.y, 120, labelSize.height);
                                                                                                                                         
    label.backgroundColor = [UIColor lightGrayColor];
    label.font = [UIFont systemFontOfSize:17];
    [label setLineBreakMode:NSLineBreakByWordWrapping];
    [label setNumberOfLines:0];
    
//    [self.view addSubview:label];
    
#pragma mark segmentControl
    NSArray *segmentItems = [[NSArray alloc] initWithArray:@[@"投资",@"产品详情", @"项目信息", @"加入记录"]];
    UISegmentedControl *segmentControl = [[UISegmentedControl alloc] initWithItems:segmentItems];
    //segmentControl.segmentedControlStyle = UISegmentedControlStyleBar;
    segmentControl.selectedSegmentIndex = 0;
    segmentControl.frame = CGRectMake(0, 68, self.view.frame.size.width, 20);
    [self.view addSubview:segmentControl];
//    self.navigationItem.backBarButtonItem
//    self.navigationItem.titleView = segmentControl;
    
    // Do any additional setup after loading the view.
    self.navigationItem.backBarButtonItem.title = @"返回";
    
#pragma mark 设置detail view
    _viewArray = [[NSArray alloc] initWithObjects:[[UIView alloc] init], [[UIView alloc] init], [[UIView alloc] init], [[UIView alloc] init], nil];
    UIFont *labelFont = [UIFont systemFontOfSize:16];
    
    UILabel *limitLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 90, 115, 20)];
    limitLabel.text = @"总额度";
    limitLabel.font = labelFont;
    
    UILabel *rateLabel = [[UILabel alloc] initWithFrame:CGRectMake(130, 90, 115, 20)];
    rateLabel.text = @"年化利率";
    rateLabel.font = labelFont;
    
    NSMutableArray *labelArray = [[NSMutableArray alloc] initWithCapacity:16];
//    ((UILabel *)labelArray[0]).frame = CGRectMake(15, 90, 115, 20);
//    ((UILabel *)labelArray[0]).text = @"Test";
    
    for (NSInteger i = 0 ; i < 16; i++) {
        [labelArray addObject:[[UILabel alloc] init]];
        ((UILabel *)labelArray[i]).font = labelFont;
        if (i <= 5) {
            ((UILabel *)labelArray[i]).frame = CGRectMake(15 + 115 * (i%3), 90 + (NSInteger)(i/3)*30, 115, 20);
//            ((UILabel *)labelArray[i]).text = @"test";
            if (i==2 | i == 5) {
                ((UILabel *)labelArray[i]).textAlignment = NSTextAlignmentRight;
            }else if (i==1| i==4) {
                ((UILabel *)labelArray[i]).textAlignment = NSTextAlignmentCenter;
            }
        } else {
            ((UILabel *)labelArray[i]).frame = CGRectMake(15 + (NSInteger)(i%2)*180, 150 + (NSInteger)((i - 6)/2)*30, 165, 20);
//            ((UILabel *)labelArray[i]).text = [NSString stringWithFormat:@"test%ld", i];
            if ((NSInteger)(i%2) == 1) {
                ((UILabel *)labelArray[i]).textAlignment = NSTextAlignmentRight;
            }
        }
//        NSLog(@"label %ld text is %@", i, ((UILabel *)labelArray[i]).text);
        [_viewArray[0] addSubview:labelArray[i]];
        }
//    labelArray[0].text = @"总额度";rr
//    
    
//    [_viewArray[0] addSubview:labelArray[0]];
//    [_viewArray[0] addSubview:rateLabel];
    ((UILabel *)labelArray[0]).text = @"总额度";
    ((UILabel *)labelArray[1]).text = @"年化利率";
    ((UILabel *)labelArray[2]).text = @"投资期限";
    ((UILabel *)labelArray[6]).text = @"投资进度";
    ((UILabel *)labelArray[8]).text = @"发布日期";
    ((UILabel *)labelArray[10]).text = @"投资金额";
    ((UILabel *)labelArray[12]).text = @"计划可投金额";
    ((UILabel *)labelArray[11]).text = @"元";
    ((UILabel *)labelArray[14]).text = @"投资进度";
    UITextField *investAmout = [[UITextField alloc] initWithFrame:CGRectMake(130, 310, 200, 30)];
    investAmout.placeholder = @"输入投资金额，一元起投";
    investAmout.font = labelFont;
    investAmout.borderStyle = UITextBorderStyleRoundedRect;
    investAmout.allowsEditingTextAttributes = YES;
    [investAmout setEnabled:YES];
    [investAmout resignFirstResponder];
//    investAmout.f÷
    [_viewArray[0] insertSubview:investAmout atIndex:1];
    [self.view addSubview:_viewArray[0]];
    
    [_viewArray[0] setHidden:NO];

    
    [segmentControl addTarget:self action:@selector(segmentTurn:) forControlEvents:UIControlEventValueChanged];
    
    
}

- (void) segmentTurn:(UISegmentedControl *) seg {
    NSInteger index = seg.selectedSegmentIndex;
    for (NSInteger i = 0; i < [self.viewArray count]; i++) {
        if (i == index) {
            [_viewArray[i] setHidden:NO];
            
        }
        else {
            [_viewArray[i] setHidden:YES];
            
        }
    }
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
