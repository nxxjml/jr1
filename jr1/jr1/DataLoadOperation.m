//
//  DataLoadOperation.m
//  jr1
//
//  Created by simao on 15/12/5.
//  Copyright © 2015年 simao. All rights reserved.
//

#import "DataLoadOperation.h"
#import "AppDelegate.h"

@implementation DataLoadOperation
@synthesize targetURL;

- (id)initWithURL:(NSURL *)url {
    if (![super init]) {
        return nil;
    }
    [self setTargetURL:url];
    return self;
}

- (void)dealloc{
    [targetURL release];
    targetURL = nil;
    [super dealloc];
}

- (void)main {
    NSString *webpageString = [[NSString alloc] initWithContentsOfURL:[self targetURL]];
    NSError *erroro = nil;
    
    
}

@end
