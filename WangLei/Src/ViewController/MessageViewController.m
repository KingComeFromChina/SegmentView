//
//  MessageViewController.m
//  WangLei
//
//  Created by 王垒 on 16/8/11.
//  Copyright © 2016年 王垒. All rights reserved.
//

#import "MessageViewController.h"
#import "SegmentView.h"
#import "MessageContentTableView.h"



@interface MessageViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) SegmentView *segmentView;

@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createSubViews];
}

- (void)createSubViews {
    [self createSegmentView];
    [self createScrollView];
}
- (void)createSegmentView {
    SegmentView *segmentView = [[SegmentView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, 44)];
    self.segmentView = segmentView;
    __weak typeof (self)weakSelf = self;
    segmentView.segmentButtonClickBlock = ^(SegmentType segmentType, NSInteger index){
        [weakSelf.scrollView setContentOffset:CGPointMake(index*weakSelf.scrollView.bounds.size.width, 0) animated:YES];
    };
    [self.view addSubview:segmentView];
    
}

- (void)createScrollView {
    CGFloat marginTop = self.segmentView.bounds.size.height + self.segmentView.frame.origin.y;
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, marginTop, self.view.bounds.size.width, self.view.bounds.size.height - marginTop)];
    scrollView.backgroundColor = [UIColor whiteColor];
    self.scrollView = scrollView;
    scrollView.pagingEnabled = YES;
    scrollView.contentSize = CGSizeMake(scrollView.bounds.size.width*3, scrollView.bounds.size.height);
    scrollView.bounces = NO;
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
    
    for (int i = 0; i < 3; i++) {
        MessageContentTableView *tableView = [[MessageContentTableView alloc] initWithFrame:CGRectMake(i*scrollView.frame.size.width, 0, scrollView.bounds.size.width, scrollView.bounds.size.height) style:UITableViewStylePlain];
        
        [scrollView addSubview:tableView];
    }
}


#pragma  mark -
#pragma mark -UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    //更新 segmentView的选中状态
    [self.segmentView updateWithIndex:scrollView.contentOffset.x/scrollView.bounds.size.width];
}




@end
