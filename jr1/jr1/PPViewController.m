//
//  PPViewController.m
//  jr1
//
//  Created by simao on 15/11/7.
//  Copyright © 2015年 simao. All rights reserved.
//

#import "PPViewController.h"
#import "AppDelegate.h"

@interface PPViewController ()
//@property (weak, nonatomic) IBOutlet UIImageView *imageView1;
//@property (weak, nonatomic) UIImageView *imageView2;

@end

@implementation PPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CGFloat ImageHeight = 300;
    
    self.arrayImages = [NSArray arrayWithObjects:[UIImage imageNamed:@"1.png"],[UIImage imageNamed:@"2.png"],[UIImage imageNamed:@"3.png"],[UIImage imageNamed:@"3.png"], nil];
    
        
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,ImageHeight)];
    [_scrollView setPagingEnabled:YES];
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    [_scrollView setDelegate:self];
    [_scrollView setBackgroundColor:[UIColor lightGrayColor]];
    
    //ContentSize 这个属性对于UIScrollView挺关键的，取决于是否滚动。
    [_scrollView setContentSize:CGSizeMake(CGRectGetWidth(self.view.frame) * [self.arrayImages count], ImageHeight)];
    [self.view addSubview:_scrollView];
    
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, self.scrollView.frame.size.height - 20, self.scrollView.frame.size.width, 20)];
    [_pageControl setBackgroundColor:[UIColor blackColor]];
    
    _pageControl.currentPage = 0;
    _pageControl.numberOfPages = [self.arrayImages count];
    [_pageControl addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_pageControl];
    
    _viewController = [[NSMutableArray alloc] init];
    
    for (NSInteger i = 0; i < [self.arrayImages count]; i++) {
        [_viewController addObject:[NSNull null]];
    }
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(scrollPages) userInfo:nil repeats:YES];
    
    [self loadScrollViewPage:0];
    [self loadScrollViewPage:1];
    [self loadScrollViewPage:2];
    [self loadScrollViewPage:3];
    
    UITableView* tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 400, self.view.frame.size.width, ImageHeight) style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 10)];
    
    
    
}

-(void)loadScrollViewPage:(NSInteger)page
{
    if (page >= self.arrayImages.count) {
        return;
    }
    
    UIViewController *imageViewController = [self.viewController objectAtIndex:page];
    if ((NSNull *)imageViewController == [NSNull null])
    {
        imageViewController = [[UIViewController alloc] init];
        [self.viewController replaceObjectAtIndex:page withObject:imageViewController];
    }
    
    if (imageViewController.view.superview == nil) {
        CGRect frame = self.scrollView.frame;
        frame.origin.x = CGRectGetWidth(frame) * page;
        frame.origin.y = 0;
        imageViewController.view.frame = frame;
        
        //[self addChildViewController:imageViewController];
        [self.scrollView addSubview:imageViewController.view];
        [imageViewController didMoveToParentViewController:self];
        
        //[imageViewController.view setBackgroundColor:[UIColor colorWithPatternImage:(UIImage *)[self.arrayImages objectAtIndex:page]]];
        [imageViewController.view setBackgroundColor:[UIColor colorWithPatternImage:(UIImage *)[self.arrayImages objectAtIndex:page]]];
    }
}


-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat pageWidth = CGRectGetWidth(self.scrollView.frame);
    NSInteger page = floor((self.scrollView.contentOffset.x -pageWidth/2)/pageWidth) +1;
    self.pageControl.currentPage = page;
    
    [self loadScrollViewPage:page-1];
    [self loadScrollViewPage:page];
    [self loadScrollViewPage:page+1];
}

- (IBAction)changePage:(id)sender
{
    NSInteger page = self.pageControl.currentPage;
    
    [self loadScrollViewPage:page - 1];
    [self loadScrollViewPage:page];
    [self loadScrollViewPage:page + 1];
    
    CGRect bounds = self.scrollView.bounds;
    bounds.origin.x = CGRectGetWidth(bounds) * page;
    bounds.origin.y = 0;
    [self.scrollView scrollRectToVisible:bounds animated:YES];
}

-(void)scrollPages{
    ++self.pageControl.currentPage;
    CGFloat pageWidth = CGRectGetWidth(self.scrollView.frame);
    if (isFromStart) {
        [self.scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
        self.pageControl.currentPage = 0;
    }
    else
    {
        [self.scrollView setContentOffset:CGPointMake(pageWidth*self.pageControl.currentPage, self.scrollView.bounds.origin.y)];
        
    }
    if (_pageControl.currentPage == _pageControl.numberOfPages - 1) {
        isFromStart = YES;
    }
    else
    {
        isFromStart = NO;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Datasource method
#pragma mark return number of group
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

#pragma mark Return number of rows in section
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* TableSampleIdentifier = @"TableSampleIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TableSampleIdentifier];
    if (cell == nil ) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:TableSampleIdentifier];
    
    }
    /*
    else {
        while ([cell.contentView.subviews lastObject] != nil) {
            [(UIView *)[cell.contentView.subviews lastObject] removeFromSuperview];
        }
    }*/
    
   // NSInteger row = [indexPath row];
    //cell.imageView.bounds = CGRectMake(0, 0, 20, 20);
    //cell.detailTextLabel.text = @"detail";
    NSArray *subT = @[@"改变你的投资方式",@"安心Make Money的理财计划"];
    NSArray *title = @[@"PP宝",@"MM计划"];
                      
    cell.textLabel.text = title[indexPath.section];
    cell.textLabel.font = [UIFont boldSystemFontOfSize:20.0f];
    cell.textLabel.backgroundColor = [UIColor clearColor];
    cell.detailTextLabel.text = subT[indexPath.section];
    cell.detailTextLabel.font = [UIFont systemFontOfSize:10.0f];
    cell.detailTextLabel.backgroundColor = [UIColor clearColor];
    
    //cell.textLabel.bounds.origin.x = 20.0;
    CGRect frame = cell.textLabel.frame;
    NSLog(@"%f,%f,%f,%f",frame.origin.x,frame.origin.y, frame.size.width,frame.size.height);
    frame.origin.x = 50.0;
    cell.textLabel.frame = frame;
    
    NSString *imgName = [NSString stringWithFormat:@"img%ld.png", (long)[indexPath section]];
    UIImage *image = [UIImage imageNamed:imgName];
    cell.imageView.image = image;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
  //  NSLog(@"%f,%f,%f,%f",imageView.frame.origin.x,imageView.frame.origin.y, imageView.frame.size.width,imageView.frame.size.height);
    
    
    //CGRect cellFrame = [cell frame];
    //cellFrame.origin = CGPointMake(0, 0);
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([indexPath section] == 0) {
        return 50.0;
    }
    else if ([indexPath section] == 1) {
    return 50.0;
    }
    else {
        return 50.0;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10.0;
}
#pragma mark return head title of section
- (NSString*) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSArray *projName = @[@"PP", @"MM"];
    return  projName[section];
}
/*
#pragma mark return foot title of section
- (NSString*) tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    return @"MM";
}*/

/*- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForFooterInSection:(NSInteger)section {
    return 20.0;
    
}
*/


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    AppDelegate *appDelegate = (AppDelegate*) [[UIApplication sharedApplication] delegate];
    UITabBarController *tabViewController = (UITabBarController*) appDelegate.window.rootViewController;
    NSInteger index = [indexPath section] +1;
    [tabViewController setSelectedIndex:index];
    NSLog(@"%ld", index);
    
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
