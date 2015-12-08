//
//  PcDetailsViewController.h
//  jr1
//
//  Created by simao on 15/12/6.
//  Copyright © 2015年 simao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFNetworking.h"
//#import "TFHpple.h"
//#import "TFHppleElement.h"
//#import "XPathQuery.h"

@interface PcDetailsViewController : UIViewController<NSURLSessionDataDelegate>
@property (retain, strong) UILabel *pageTitle;
@property (copy, nonatomic, readwrite) NSString *pageTitleText;
@property (retain, nonatomic) UILabel *pageContent;
@property (copy, nonatomic) NSString *pageContentText;
@property (retain) NSMutableData *receivedData;
@property (retain, nonatomic) NSDictionary *dict;


@end
