//
//  DataLoadOperation.h
//  jr1
//
//  Created by simao on 15/12/5.
//  Copyright © 2015年 simao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <libxml/HTMLparser.h>

@interface DataLoadOperation : NSOperation
@property (retain) NSURL *targetURL;

- (id)initWithURL:(NSURL*)url;

@end
