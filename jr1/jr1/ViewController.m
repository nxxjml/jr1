//
//  ViewController.m
//  jr1
//
//  Created by simao on 15/11/7.
//  Copyright © 2015年 simao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIScrollView *_scrollview;
}


@end

@implementation ViewController

- (void)pageTurn: (UIPageControl*)sender
{
    CGSize viewSize = helpScrView.frame.size;
    CGRect rect = CGRectMake(sender.currentPage * viewSize.width, 0, viewSize.width, viewSize.height);
    [helpScrView scrollRectToVisible:rect animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIScrollView* scrollView = [[UIScrollView alloc] init];
    scrollView.frame = CGRectMake(0, 0, 250, 250);
    scrollView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:scrollView];
    
    UIImageView* imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"big.png"];
    CGFloat imgW = imageView.image.size.width;
    CGFloat imgH = imageView.image.size.height;
    imageView.frame = CGRectMake(0, 0, imgW, imgH);
    
    [scrollView addSubview:imageView];
    
    scrollView.contentSize = imageView.image.size;
    
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    
    scrollView.bounces = NO;
    
    scrollView.contentInset = UIEdgeInsetsMake(20, 20, 20, 20);
    
    _scrollview = scrollView;
    
}

- (IBAction)down:(UIButton *)sender
{
    [UIView animateWithDuration:1.0 animations:^{
        CGPoint offset = _scrollview.contentOffset;
        offset.y +=150;
        _scrollview.contentOffset = offset;
        
    }];
}

    // Do any additional setup after loading the view, typically from a nib.
    
    /*
    CGRect bounds = self.view.frame;
    
    NSLog(@"x is %f, y is %g, width is  %f, height is %f", bounds.origin.x, bounds.origin.y, bounds.size.width, bounds.size.height);
    
    //UIImageView* imageView1 = [[[UIImageView alloc] initWithFrame:CGRectMake(0, bounds.origin.y, bounds.size.width, bounds.size.height)] autorelease];
    UIImageView* imageView1 = [[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 300, 600)] autorelease];
    //[imageView1 setImage:[UIImage imageNamed:@"1.png"]];
    [imageView1 setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"1.png"]]];
    UIImageView* imageView2 = [[[UIImageView alloc] initWithFrame:CGRectMake(1*bounds.size.width, bounds.origin.y, bounds.size.width, bounds.size.height)] autorelease];
    [imageView2 setImage:[UIImage imageNamed:@"2.jpg"]];
    UIImageView* imageView3 = [[[UIImageView alloc] initWithFrame:CGRectMake(2*bounds.size.width, bounds.origin.y, bounds.size.width, bounds.size.height)] autorelease];
    [imageView2 setImage:[UIImage imageNamed:@"3"]];
    
    helpScrView = [[UIScrollView alloc] initWithFrame:CGRectMake(bounds.origin.x, bounds.origin.y, bounds.size.width, 300)];
    [helpScrView setContentSize:CGSizeMake(bounds.size.width*6, 300)];
    helpScrView.pagingEnabled = YES;
    helpScrView.bounces = NO;
    [helpScrView setDelegate:self];
    helpScrView.showsHorizontalScrollIndicator = NO;
    [helpScrView addSubview:imageView2];
    [helpScrView addSubview:imageView1];
    [helpScrView addSubview:imageView3];
    
    pageCtrl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 400, bounds.size.width, 30)];
    pageCtrl.numberOfPages = 3;
    pageCtrl.currentPage = 1;
    [pageCtrl addTarget:self action:@selector(pageTurn:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:pageCtrl];
    
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGPoint offset = scrollView.contentOffset;
    CGRect bounds = scrollView.frame;
    [pageCtrl setCurrentPage:1];//offset.x / bounds.size.width ];
    NSLog(@"%f", offset.x/bounds.size.width); 
}

  */


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
