//
//  HTMLParser.h
//  jr1
//
//  Created by simao on 15/12/5.
//  Copyright © 2015年 simao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TFHpple.h"
#import "TFHppleElement.h"
#import "XPathQuery.h"

@interface HTMLParser : NSOperation
@property (retain) NSURL *targetURL;
@property (retain) NSString *label;
@property (retain) NSString *keyWord;

@end
