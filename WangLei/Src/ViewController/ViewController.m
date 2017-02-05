//
//  ViewController.m
//  WangLei
//
//  Created by 王垒 on 16/8/11.
//  Copyright © 2016年 王垒. All rights reserved.
//

#import "ViewController.h"
#import "MessageViewController.h"



@interface ViewController ()

@end

@implementation ViewController


+ (void)initialize {
    UINavigationBar *navigationBar = [UINavigationBar appearance];
    [navigationBar setBarTintColor:[UIColor greenColor]];
    [navigationBar setTintColor:[UIColor whiteColor]];
    [navigationBar setTitleTextAttributes:@{
                                            NSForegroundColorAttributeName:[UIColor whiteColor],
                                            NSFontAttributeName:[UIFont systemFontOfSize:17.f],
                                            }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"tap" style:UIBarButtonItemStyleDone target:self action:@selector(showMessageVC)];
    self.navigationItem.title = @"失物招领";
}

- (void)showMessageVC {
    MessageViewController *messageVC = [[MessageViewController alloc] init];
    [self.navigationController pushViewController:messageVC animated:YES];
}









@end
