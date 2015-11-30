//
//  PCViewController.m
//  jr1
//
//  Created by simao on 15/11/28.
//  Copyright © 2015年 simao. All rights reserved.
//

#import "PCViewController.h"

@interface PCViewController ()

@end

@implementation PCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-48)];
    [_scrollView setPagingEnabled:YES];
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = YES;
    _scrollView.scrollEnabled = YES;
    //[_scrollView setDelegate:self];
    _scrollView.delegate = self;
   // [_scrollView setContentSize:CGSizeMake(self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:_scrollView];
    
    /**
     *content
     **/
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 20, 120, 120)];
    UIImage *img = [UIImage imageNamed:@"mmjh.png"];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.image = img;
    [_scrollView addSubview:imageView];
#pragma mark username
    UILabel *userName = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 30, 40, 150, 20)];
    userName.text = @"用户名：";
    userName.backgroundColor = [UIColor lightGrayColor];
    [userName sizeToFit];
    [_scrollView addSubview:userName];
    
    UILabel *userNameText = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width-120, 40, 100, 20)];
    userNameText.text = @"xiaoxue";
    userNameText.textAlignment = NSTextAlignmentRight;
    userNameText.backgroundColor = [UIColor lightGrayColor];
    //[userNameText sizeToFit];
    [_scrollView addSubview:userNameText];
    
    
#pragma mark property
    UILabel *totalProperty = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 30, 70, 80, 20)];
    totalProperty.text = @"总资产：";
    totalProperty.backgroundColor = [UIColor lightGrayColor];
    [totalProperty sizeToFit];
    [_scrollView addSubview:totalProperty];
    
    UILabel *totalPropertyNum = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 120, 70, 100, 20)];
    totalPropertyNum.text = @"1000000.0";
    totalPropertyNum.backgroundColor = [UIColor lightGrayColor];
    totalPropertyNum.textAlignment = NSTextAlignmentRight;
    //[totalPropertyNum sizeToFit];
    [_scrollView addSubview:totalPropertyNum];
    
    
    UILabel *avilableProperty = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 30, 100, 150, 20)];
    avilableProperty.text = @"可用余额：";
    avilableProperty.backgroundColor = [UIColor lightGrayColor];
    [avilableProperty sizeToFit];
    [_scrollView addSubview:avilableProperty];
    
    UILabel *avilablePropNum = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 120, 100, 100, 20)];
    avilablePropNum.text = @"1000000.0";
    avilablePropNum.backgroundColor = [UIColor lightGrayColor];
    avilablePropNum.textAlignment = NSTextAlignmentRight;
    //[totalPropertyNum sizeToFit];
    [_scrollView addSubview:avilablePropNum];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 120, self.view.frame.size.width, self.view.frame.size.height - 120) style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
   // [_scrollView addSubview:tableView];
    tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 20)];
    tableView.scrollEnabled = NO;
    
    CGRect frame = tableView.frame;
    NSLog(@"content height = %f, frame height = %f",tableView.frame.size.height, tableView.contentSize.height);
    frame.size.height = tableView.contentSize.height;
    tableView.frame = frame;
    
     NSLog(@"scrollview height = %f", _scrollView.contentSize.height);
    [_scrollView addSubview:tableView];
   // [_scrollView setContentSize:CGSizeMake(self.view.frame.size.width, 120 + tableView.contentSize.height)];  // update contentSize of scrollView!!
    
#pragma mark exit button
    UIView *btnViw = [[UIView alloc] initWithFrame:CGRectMake(0, 120 + tableView.contentSize.height, self.view.frame.size.width, 30)];
//    UIButton *exitBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 120 + tableView.contentSize.height, 200, 40)];
//    UIButton *exitBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width /2 -100, 125 + tableView.contentSize.height, 200, 20)];

    UIButton *exitBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    exitBtn.frame = CGRectMake(self.view.frame.size.width /2 -40, 5, 80, 20);
    [exitBtn.layer setCornerRadius:4.0];
    
    [exitBtn setTitle:@"退出登录" forState:UIControlStateNormal];
    [exitBtn setBackgroundColor:[UIColor blueColor]];
    [exitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btnViw setBackgroundColor:[UIColor lightGrayColor]];
    [exitBtn addTarget:self action:@selector(logOutBtnDownRecover:) forControlEvents:UIControlEventTouchUpInside];
    //[exitBtn sizeToFit];
    [btnViw addSubview:exitBtn];
    [_scrollView addSubview:btnViw];
    [_scrollView setContentSize:CGSizeMake(self.view.frame.size.width, 120 + tableView.contentSize.height + btnViw.frame.size.height)];
    NSLog(@"scrollview height = %f", _scrollView.contentSize.height);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
  
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    NSArray *nums = @[@4,@2,@2,@3];
    NSInteger num = 2;
//    
//    NSLog(@"number of row is %ld", num);
//    return num;
    
    switch (section) {
        case 0:
            num =4;
            break;
        case 1:
            num = 2;
            break;
        case 2:
            num = 2;
            break;
        case 3:
            num = 3;
            break;
            
            
        default:
            num = 4;
            break;
    }
    return num;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *TbViewCellIdent = @"tbCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TbViewCellIdent];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:TbViewCellIdent];
    }
    NSArray *tbcTitle = @[@[@"账户充值",@"账户提现",@"我的银行卡",@"账户资产"],@[@"交易记录",@"消息通知"],@[@"个人信息",@"安全设置"],@[@"常见问题",@"访问论坛",@"联系我们"]];
    cell.textLabel.text = tbcTitle[indexPath.section][indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10.0;
}


#pragma mark logout button down event
- (void)logOutBtnDownRecover:(id)sender {
    UIButton *btn = (UIButton *) sender;
//    [[[UIAlertView alloc] initWithTitle:@"Button" message:[NSString stringWithFormat:@"This is button %@", btn] delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"ok", nil] show];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Button" message:[NSString stringWithFormat:@"This is button %@", btn] preferredStyle:UIAlertControllerStyleAlert]; //UIAlertControllerStyleActionSheet 是显示在屏幕底部，UIAlertControllerStyleAlert 是显示在中间
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *confirm = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:cancel];
    [alert addAction:confirm];
    //[self presentViewController:alert animated:YES completion:nil];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField){
        textField.placeholder = @"登陆";
        [textField resignFirstResponder];
    }];
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"密码";
        textField.secureTextEntry = YES;
    }];
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField){
        textField.placeholder = @"添加监听代码";
        

        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(alertTextFieldTextDidChange:) name:UITextFieldTextDidChangeNotification object:textField];
    }];
    [self presentViewController:alert animated:YES completion:nil];
    
  
    
    
}

- (void)alertTextFieldTextDidChange:(NSNotification *)notification {
    UIAlertController *alert = (UIAlertController *)self.presentedViewController;
    if (alert) {
        UITextField *lisen = alert.textFields[2];
        UIAlertAction *action = alert.actions.lastObject;
        action.enabled = lisen.text.length >= 6;
    }
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
