//
//  PPViewController.h
//  jr1
//
//  Created by simao on 15/11/7.
//  Copyright © 2015年 simao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PPViewController : UIViewController<UIScrollViewDelegate,UITableViewDataSource, UITableViewDelegate>

{
    BOOL isFromStart;
}

@property(nonatomic, strong)UIScrollView  *scrollView;      //声明一个UIScrollView
@property(nonatomic, strong)UIPageControl *pageControl;     //声明一个UIPageControl
@property(nonatomic, strong)NSArray  *arrayImages;          //存放图片的数组
@property(nonatomic, strong)NSMutableArray *viewController; //存放UIViewController的可变数组
@property(nonatomic, strong)NSTimer *timer;


@end
