//
//  PPBViewController.m
//  jr1
//
//  Created by simao on 15/11/28.
//  Copyright © 2015年 simao. All rights reserved.
//

#import "PPBViewController.h"

@interface PPBViewController ()

@end

@implementation PPBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,self.view.frame.size.height) style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView  {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //NSArray *numberOfSec = @[@1, @4, @4];
    NSInteger num = (section == 0) ? 1 : 4;
    NSLog(@"%ld", num);
    return num;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *TabCellIdentifier = @"TabCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TabCellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:TabCellIdentifier];
        }
    NSArray *titleContent = @[@[@"昨日收益（元）"],@[@"pp宝总资产", @"申购待确认份额", @"赎回在途金额", @"累计收益"],@[@"投资", @"赎回", @"交易记录", @"预约纪录"]];
    //NSArray *content2 = @[@"投资", @"赎回", @"交易记录", @"预约纪录"];
    
    cell.textLabel.text = titleContent[indexPath.section][indexPath.row];
    if (indexPath.section != 2) {
        cell.detailTextLabel.text = @"0";
    }
    
    //NSLog(@"%@", cell.textLabel.text);
    if (indexPath.section != 1) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    
    return  cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat height = (indexPath.section == 0) ? 70.0 : 40.0;
    return height;
    
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
