//
//  RecordsViewController.m
//  jr1
//
//  Created by simao on 15/12/1.
//  Copyright © 2015年 simao. All rights reserved.
//

#import "RecordsViewController.h"

@interface RecordsViewController ()



@end

@implementation RecordsViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"MM计划交易记录";
    NSArray *segmentedArray = [[NSArray alloc] initWithObjects:@"近期投资记录", @"近期回款记录", nil];
    UISegmentedControl *segmentControl = [[UISegmentedControl alloc] initWithItems:segmentedArray];
    segmentControl.frame = CGRectMake(0, 70, self.view.frame.size.width, 20);
    segmentControl.selectedSegmentIndex = 0;
    segmentControl.tintColor = [UIColor colorWithRed:0.2 green:0.2 blue:1 alpha:0.8];
    //segmentControl.momentary = YES;
    //[segmentControl setTitle:@"YES" forSegmentAtIndex:1];
    [self.view addSubview:segmentControl];
    [segmentControl.layer setCornerRadius:0.0];
    // segmentControl.segmentedControlStyle = UISegmentedControlStyleBar;
    self.tableView.frame = CGRectMake(0, 40, self.view.frame.size.width , self.view.frame.size.height - 88);
    [segmentControl addTarget:self action:@selector(showDetails:) forControlEvents:UIControlEventValueChanged];
    self.recordsItemsArray = @[@[@"投资日期",@"项目编号", @"投资额度", @"年华利率"],@[@"20150101", @"MM201501010001", @"100000.0", @"12.00%"], @[@"20151101", @"MM201511010001", @"100000.00", @"12.00%"]];
    [self.tableView reloadData];
    
}

- (void)showDetails:(UISegmentedControl *)seg {
    NSInteger index = seg.selectedSegmentIndex;
    switch (index) {
        case 0:
            self.recordsItemsArray = @[@[@"投资日期",@"项目编号", @"投资额度", @"年华利率"],@[@"20150101", @"MM201501010001", @"100000.0", @"12.00%"], @[@"20151101", @"MM201511010001", @"100000.00", @"12.00%"]];
            [self.tableView reloadData];
            break;
        case 1:
            self.recordsItemsArray = @[@[@"预计回款日期",@"项目编号", @"回款金额", @"状态"],@[@"20160101", @"MM201501010001", @"100000.0", @"提前回款"], @[@"20161101", @"MM201511010001", @"100000.00", @"待收"]];
            [self.tableView reloadData];
            
            break;
            
        default:
            break;
    }
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *itemsArray = self.recordsItemsArray;
   // NSArray *recordsItemsArray = @[@[@"投资日期",@"项目编号", @"投资额度", @"年华利率"],@[@"20150101", @"MM201501010001", @"100000.0", @"12.00%"], @[@"20151101", @"MM201511010001", @"100000.00", @"12.00%"]];
    JRTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"recordsCell"];
    //NSLog(@"Array items count is %@", recordsItemsArray[indexPath.row][3]);
    cell.dateLable.text = itemsArray[indexPath.row][0];
    cell.dateLable.lineBreakMode = NSLineBreakByCharWrapping;
    cell.dateLable.numberOfLines = 0;
   // cell.dateLable.frame = CGRectMake(0, 6, 100, 20);
    
    cell.numLable.text = itemsArray[indexPath.row][1];
    cell.numLable.numberOfLines = 0;
    cell.numLable.lineBreakMode = NSLineBreakByCharWrapping;
    cell.amountLable.text = itemsArray[indexPath.row][2];
    cell.amountLable.numberOfLines = 0;
    cell.amountLable.lineBreakMode = NSLineBreakByCharWrapping;
    cell.rateLable.text = itemsArray[indexPath.row][3];
    return cell;
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

- (void)dealloc {
    [_tableView release];
    [super dealloc];
}
@end
