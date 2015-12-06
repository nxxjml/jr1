//
//  PcDetailsViewController.h
//  jr1
//
//  Created by simao on 15/12/6.
//  Copyright © 2015年 simao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TFHpple.h"
#import "TFHppleElement.h"
#import "XPathQuery.h"

@interface PcDetailsViewController : UIViewController<NSURLSessionDataDelegate>
@property (retain, nonatomic) UILabel *pageTitle;
@property (retain, nonatomic) UILabel *pageContent;
@property (retain) NSMutableData *receivedData;

@end
