//
//  ProductsViewController.m
//  jr1
//
//  Created by simao on 15/12/1.
//  Copyright © 2015年 simao. All rights reserved.
//

#import "ProductsViewController.h"

@interface ProductsViewController ()
@property (retain, nonatomic)  ProductDetialsViewController *productDetialViewController;
@property (retain, nonatomic) NSString *segueIdentifier;
@property (retain, nonatomic) UIStoryboardSegue *segue;


@end

@implementation ProductsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"MM计划系列产品";
    _tableView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-48);
//    NSLog(@"view frame widht = %f", self.view.frame.size.width);
    _tableView.dataSource = self;
    _tableView.delegate = self;
    //_tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 10)];
    _productsItemArray = [[NSArray alloc] initWithArray: @[@[@"3号MM计划｜MM-11111154-6M",@"12%", @"6个月", @"1元"],@[@"2号MM计划｜MM-11111153-3M", @"11%", @"3个月", @"1元"], @[@"1号MM计划｜MM-11111151-1M", @"10%", @"1个月", @"1元"]]];
    [_tableView reloadData];
   // ProductDetialsViewController *productDetialViewController = [[ProductDetialsViewController alloc] init];
    _productDetialViewController = [[ProductDetialsViewController alloc] init];
    _segueIdentifier = @"productDetails";
    
    _segue = [[UIStoryboardSegue alloc] initWithIdentifier:_segueIdentifier source:self destination:_productDetialViewController];
#pragma mark 设置navigation button的title
    UIBarButtonItem *tempItem = [[UIBarButtonItem alloc] init];
    tempItem.title = @"返回";
    self.navigationItem.backBarButtonItem = tempItem;
    [tempItem release];
    
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSInteger num = [_productsItemArray count];
    return num;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ProductTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"productCell"];
    NSArray *itemsArray = _productsItemArray;
    cell.expectedRevenueData.text = itemsArray[indexPath.section][1];
    cell.lockUpPeriodData.text = itemsArray[indexPath.section][2];
    cell.minimumAmountData.text = itemsArray[indexPath.section][3];
    [cell.applyInvestBtn setBackgroundColor:[UIColor blueColor]];
//    NSLog(@"cell width  = %f", cell.frame.size.width);
    CGRect frame = cell.frame;
    frame.size.width = self.view.frame.size.width;
    cell.frame = frame;
    
    return cell;
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *title = _productsItemArray[section][0];
    return title;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
   // UIStoryboardSegue *segue = [[UIStoryboardSegue alloc] initWithIdentifier:_segueIdentifier source:self destination:_productDetialViewController];
    [self performSegueWithIdentifier:@"productDetailSegue" sender:indexPath];
//    [self performSegueWithIdentifier:_segueIdentifier sender:indexPath];
    
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    //NSArray *array = _productsItemArray;
  
    UIViewController *vc = segue.destinationViewController;
    NSIndexPath *indexPath = (NSIndexPath *)sender;
//    NSString *title = self.productsItemArray[0][0];
    //NSLog(@"title = %@",array);
    vc.navigationItem.title = _productsItemArray[indexPath.section][0]; //设置跳转后的view的navigation title
    
//    vc.navigationItem.title = _segueIdentifier;
//    [vc setValue:title forKey:navigationItem.title];
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
