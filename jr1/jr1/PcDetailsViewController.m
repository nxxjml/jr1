//
//  PcDetailsViewController.m
//  jr1
//
//  Created by simao on 15/12/6.
//  Copyright © 2015年 simao. All rights reserved.
//

#import "PcDetailsViewController.h"

@interface PcDetailsViewController ()

@end

@implementation PcDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _pageTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 88, self.view.frame.size.width, 20)];
    _pageContent = [[UILabel alloc] initWithFrame:CGRectMake(0, 108, self.view.frame.size.width, self.view.frame.size.height - 132)];
    
//    _pageTitle.text = @"test";
    NSString *usrString = @"https://www.jr1.cn/MM/Wealth/wealth_list.html";
    NSString *nodeString = @"//div[@class='mmn_m_cen']";
    NSArray *elements = [self ParserHTML:nodeString WithURL:usrString];
    //    NSString *contentString = [NSString stringWithFormat:@"%@", [elements objectAtIndex:1]];
    //    textContent.text = contentString;
    NSLog(@"Number of itmes in elements is %ld", [elements count]);
    //NSLog(@"%@",contentString);
    if ([elements count] != 0) {
        TFHppleElement *e = [elements objectAtIndex:0];
        NSString *content2 = [e content];
        NSLog(@"%@", content2);
//        textContent.text = content2;
        _pageContent.text = content2;
    }
    //    TFHppleElement *e = [elements objectAtIndex:0];
    //    NSString *content2 = [e content];
    //    NSLog(@"%@", content2);
    // textContent.text = content2[0];
    _pageTitle.backgroundColor = [UIColor lightGrayColor];
    
    [self.view addSubview:_pageTitle];
    [self.view addSubview:_pageContent];
    
    // UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    //[_recharegViewController view];
//    [self.navigationController pushViewController:_recharegViewController animated:YES];
//    _recharegViewController.view.backgroundColor = [UIColor whiteColor];
//    [_recharegViewController release];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSArray *)ParserHTML: (NSString*)nodeString WithURL:(NSString *)urlString {
    
    //    NSData *htmlData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:urlString]];
    //    NSData *toHtmlData = [self toUTF8:htmlData];
    NSURL *url = [NSURL URLWithString:urlString];
    //请求初始化，可以对缓存，超时等参数进行设置
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:20];
    //创建异步连接（2）
    //    [NSURLConnection connectionWithRequest:request delegate:self];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSLog(@"response:%@", response);
        self.receivedData = [NSMutableData dataWithData:data] ;
    }];
    [task resume];
    
    //    [request setHTTPMethod:@"POST"];
    //    [request setHTTPBody:postData];
    
    
    //    NSString *dataString = [NSString stringWithContentsOfURL:[NSURL URLWithString:urlString] encoding:NSUTF8StringEncoding error:nil];
    NSString *dataString = [[NSString alloc] initWithData:self.receivedData encoding:NSUTF8StringEncoding];
    NSLog(@"data is %@", dataString);
    NSData *htmlData = [dataString dataUsingEncoding:NSUTF8StringEncoding];
    //    NSString *nodeString = @"//div[@class='mmn_m_cen']";
    TFHpple *xpathParser = [[TFHpple alloc] initWithHTMLData:htmlData];
    NSArray *elements = [xpathParser searchWithXPathQuery:nodeString];
    return elements;
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
