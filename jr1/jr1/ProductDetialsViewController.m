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
@property (retain, nonatomic) UIView *subView1;
@property (retain, nonatomic) UIView *subView2;
@property (retain, nonatomic) UIView *subView3;
@property (retain, nonatomic) UIView *subView4;

@end

@implementation ProductDetialsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _subView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 90, self.view.frame.size.width, self.view.frame.size.height - 90)];
    _subView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 90, self.view.frame.size.width, self.view.frame.size.height - 90)];
    _subView3 = [[UIView alloc] initWithFrame:CGRectMake(0, 90, self.view.frame.size.width, self.view.frame.size.height - 90)];
    _subView4 = [[UIView alloc] initWithFrame:CGRectMake(0, 90, self.view.frame.size.width, self.view.frame.size.height - 90)];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 60, 68,120, 40)];
    NSString *labelText = @"This is detial viewcontroller";
    label.text = labelText;
//    [label setBackgroundColor:[UIColor lightGrayColor]];
//    [label sizeToFit];
    CGSize labelSize = {0, 0};
//    labelSize = [labelText sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]}];
#pragma mark UILabel自动换行
     labelSize = [labelText boundingRectWithSize:CGSizeMake(120, 500) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:17]} context:nil].size;
//    NSLog(@"w=%f,h=%f", labelSize.width, labelSize.height);
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
    UIFont *labelFont = [UIFont systemFontOfSize:14];
    
//    UILabel *limitLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 90, 115, 20)];
//    limitLabel.text = @"总额度";
//    limitLabel.font = labelFont;
//    
//    UILabel *rateLabel = [[UILabel alloc] initWithFrame:CGRectMake(130, 90, 115, 20)];
//    rateLabel.text = @"年化利率";
//    rateLabel.font = labelFont;
    
    NSMutableArray *labelArray = [[NSMutableArray alloc] initWithCapacity:16];
//    ((UILabel *)labelArray[0]).frame = CGRectMake(15, 90, 115, 20);
//    ((UILabel *)labelArray[0]).text = @"Test";
#pragma mark 设置subview1的16个label
    for (NSInteger i = 0 ; i < 16; i++) {
        [labelArray addObject:[[UILabel alloc] init]];
        ((UILabel *)labelArray[i]).font = labelFont;
        if (i <= 5) {
            ((UILabel *)labelArray[i]).frame = CGRectMake(15 + 115 * (i%3), (NSInteger)(i/3)*30, 115, 20);
//            ((UILabel *)labelArray[i]).text = @"test";
            if (i==2 | i == 5) {
                ((UILabel *)labelArray[i]).textAlignment = NSTextAlignmentRight;
            }else if (i==1| i==4) {
                ((UILabel *)labelArray[i]).textAlignment = NSTextAlignmentCenter;
            }
        } else {
            ((UILabel *)labelArray[i]).frame = CGRectMake(15 + (NSInteger)(i%2)*180, 60 + (NSInteger)((i - 6)/2)*30, 165, 20);
//            ((UILabel *)labelArray[i]).text = [NSString stringWithFormat:@"test%ld", i];
            if ((NSInteger)(i%2) == 1) {
                ((UILabel *)labelArray[i]).textAlignment = NSTextAlignmentRight;
            }
        }
//        NSLog(@"label %ld text is %@", i, ((UILabel *)labelArray[i]).text);
       // [_viewArray[0] addSubview:labelArray[i]];
        [_subView1 addSubview:labelArray[i]];
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
    _investAmoutTextField = [[UITextField alloc] initWithFrame:CGRectMake(140, 120, 200, 20)];
    _investAmoutTextField.placeholder = @"输入投资金额，一元起投";
    _investAmoutTextField.font = labelFont;
    _investAmoutTextField.borderStyle = UITextBorderStyleRoundedRect;
    _investAmoutTextField.allowsEditingTextAttributes = YES;
    [_investAmoutTextField setEnabled:YES];
    //[_investAmoutTextField resignFirstResponder];
//    [_investAmoutTextField setExclusiveTouch:YES];
    //[_investAmoutTextField setUserInteractionEnabled:YES];
//    investAmout.f÷
    //[_viewArray[1] setExclusiveTouch:YES];

    
    [_subView1 addSubview:_investAmoutTextField];
    [self.view addSubview:_subView1];
    
    //[_subView2 addSubview:_investAmoutTextField];
    [self.view addSubview:_subView2];
    [self.view addSubview:_subView3];
    [self.view addSubview:_subView4];
    
  
    
    //[(UIView *)_viewArray[0] insertSubview:_investAmoutTextField atIndex:1];
    //[self.view addSubview:_viewArray[0]];
    //[self.view insertSubview:_viewArray[0] atIndex:1];
    
    
    //[self.view addSubview:_viewArray[1]];
    //[_viewArray[1] addSubview:_investAmoutTextField];
    
//    [_viewArray[0] setHidden:NO];
    //[(UIView *)_viewArray[0] becomeFirstResponder];
//    [_viewArray[0] ge]

#pragma mark subview2
    UITableView *tableView1 = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [tableView1 setTag:1];
    tableView1.delegate = self;
    tableView1.dataSource = self;
    [_subView2 addSubview:tableView1];
    
#pragma mark subview3
    UITableView *tableView2 = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [tableView2 setTag:2];
    tableView2.delegate = self;
    tableView2.dataSource = self;
    UILabel *numTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 10, 95, 20)];
    UILabel *numDataLabel = [[UILabel alloc] initWithFrame:CGRectMake(110, 10, 135, 20)];
    UILabel *introTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 50, 95, 20)];
    UILabel *picTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 90, 95, 20)];
    
    UIButton *introBtn = [[UIButton alloc] initWithFrame:CGRectMake(130, 50, 100, 20)];
    UIButton *picBtn = [[UIButton alloc] initWithFrame:CGRectMake(130, 90, 100, 20)];
    
    numTitleLabel.text = @"项目编号";
    numDataLabel.text = @"MM-1111111155-6M";
    introTitleLabel.text = @"项目介绍";
    picTitleLabel.text = @"项目图片";
    
    [introBtn setTitle:@"点击查看" forState:UIControlStateNormal];
    [introBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
//    introBtn.backgroundColor = [UIColor lightGrayColor];
    [picBtn setTitle:@"点击查看" forState:UIControlStateNormal];
    [picBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
//    picBtn.backgroundColor = [UIColor lightGrayColor];
    //[_subView3 addSubview:tableView2];
//    [_subView3 insertSubview:btn1 atIndex:1];
    [_subView3 addSubview:numTitleLabel];
    [_subView3 addSubview:numDataLabel];
    [_subView3 addSubview:introTitleLabel];
    [_subView3 addSubview:picTitleLabel];
    [_subView3 addSubview:introBtn];
    [_subView3 addSubview:picBtn];
    
#pragma mark subview3
    UITableView *tableView3 = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [tableView3 setTag:3];
    tableView3.delegate = self;
    tableView3.dataSource = self;
    [_subView4 addSubview:tableView3];
    
    
    
    [segmentControl addTarget:self action:@selector(segmentTurn:) forControlEvents:UIControlEventValueChanged];
    [_subView1 setHidden:NO];
    [_subView2 setHidden:YES];
    [_subView3 setHidden:YES];
    [_subView4 setHidden:YES];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    if (tableView.tag ==1) {
//        NSLog(@"this is first tableView");
//    }else if (tableView.tag == 2){
//        NSLog(@"this is the second tableView");
//    }
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger num = 0;
    if (tableView.tag == 1) {
        
        num = 3;
    } else {
        num = 3;
    }
//    NSLog(@"row number of tableview is %ld", num);
    return num;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"detailCell"];
   
    if (cell == nil) {
         cell = [[DetailTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"detailCell"];
    }
    switch (tableView.tag) { //
        case 1: {
            //NSArray *itemArray1 = [[NSArray alloc] initWithArray:@[@[@"计划编号",@"MM-1111111155-6M"], @[@"年化收益率", @"12.0%"], @[@"募集开始日期", @"2015-12-02"]]]; // items for subview2
            NSArray *itemArray = [[NSArray alloc] initWithArray:@[@[@"计划编号",@"MM-1111111155-6M"], @[@"年化收益率", @"12.0%"], @[@"募集开始日期", @"2015-12-02"]]];
            cell.lLabel.text = itemArray[indexPath.row][0];
            cell.mLabel.text = itemArray[indexPath.row][1];
            [itemArray release];
            break;
        }
        case 2: {
            //NSArray *itemArray1 = [[NSArray alloc] initWithArray:@[@[@"计划编号",@"MM-1111111155-6M"], @[@"年化收益率", @"12.0%"], @[@"募集开始日期", @"2015-12-02"]]]; // items for subview2
            NSArray *itemArray = [[NSArray alloc] initWithArray:@[@[@"项目编号",@"MM-1111111155-6M"], @[@"项目介绍", @""], @[@"项目图片", @""]]];
            cell.lLabel.text = itemArray[indexPath.row][0];
            cell.mLabel.text = itemArray[indexPath.row][1];
            [itemArray release];
            break;
        }
        case 3: {
            //NSArray *itemArray1 = [[NSArray alloc] initWithArray:@[@[@"计划编号",@"MM-1111111155-6M"], @[@"年化收益率", @"12.0%"], @[@"募集开始日期", @"2015-12-02"]]]; // items for subview2
            NSArray *itemArray = [[NSArray alloc] initWithArray:@[@[@"投资人",@"加入时间", @"加入金额"], @[@"rjiihl8", @"2015-12-04", @"200.00"], @[@"12293842304", @"2015-12-02", @"100000.00"]]];
            cell.lLabel.text = itemArray[indexPath.row][0];
            cell.mLabel.text = itemArray[indexPath.row][1];
            cell.rLabel.text = itemArray[indexPath.row][2];
            [itemArray release];
            break;
        }
            
            
        default:
            break;
    }

    
    
    return cell;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_investAmoutTextField resignFirstResponder];
}


- (void) segmentTurn:(UISegmentedControl *) seg {
    NSInteger index = seg.selectedSegmentIndex;
//    for (NSInteger i = 0; i < [self.viewArray count]; i++) {
//        if (i == index) {
//            [_viewArray[i] setHidden:NO];
//            
//        }
//        else {
//            [_viewArray[i] setHidden:YES];
//            
//        }
//    }
    switch (index) {
        case 0:
            _subView1.hidden = NO;
            _subView2.hidden = YES;
            _subView3.hidden = YES;
            _subView4.hidden = YES;
            break;
            
        case 1:
            _subView1.hidden = YES;
            _subView2.hidden = NO;
            _subView3.hidden = YES;
            _subView4.hidden = YES;
            break;
            
        case 2:
            _subView1.hidden = YES;
            _subView2.hidden = YES;
            _subView3.hidden = NO;
            _subView4.hidden = YES;
            break;
            
        case 3:
            _subView1.hidden = YES;
            _subView2.hidden = YES;
            _subView3.hidden = YES;
            _subView4.hidden = NO;
            break;
            
        default:
            break;
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
