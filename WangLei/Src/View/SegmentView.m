//
//  SegmentView.m
//  WangLei
//
//  Created by 王垒 on 16/8/11.
//  Copyright © 2016年 王垒. All rights reserved.
//

#import "SegmentView.h"

@interface SegmentView ()

@property (nonatomic, strong) UIButton *selectedButton;
@property (nonatomic, strong) UIView *lineView;

@end

@implementation SegmentView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self coustomUI];
    }
    return self;
}

- (void)coustomUI {
    NSArray *titleArray = @[@"招领",@"寻物",@"我的"];
    CGFloat height = self.frame.size.height;
    CGFloat width = self.frame.size.width/titleArray.count;
    
    for (int i = 0; i < titleArray.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(i*width, 0, width, height);
        [button setTitle:titleArray[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor colorWithRed:150/255.0 green:150/255.0 blue:150/255.0 alpha:1.0] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor greenColor] forState:UIControlStateSelected];
        button.tag = 200 + i;
        if (i == 0) {
            button.selected = YES;
            self.selectedButton = button;
        }
        button.titleLabel.font = [UIFont systemFontOfSize:16];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
    }
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height - 1, self.frame.size.width, 0.5)];
    lineView.backgroundColor = [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1.0];
    [self addSubview:lineView];
    
    self.lineView = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height - 2, [UIScreen mainScreen].bounds.size.width/titleArray.count, 2)];
    CGPoint center = self.lineView.center;
    center.x = self.selectedButton.center.x;
    self.lineView.center = center;
    self.lineView.backgroundColor = [UIColor greenColor];
    [self addSubview:self.lineView];
    
}

- (void)buttonClick:(UIButton *)button{
    if (button == self.selectedButton) {
        return;
    }
    button.selected = !button.selected;
    self.selectedButton.selected = NO;
    self.selectedButton = button;
    NSInteger index = button.tag - 200;
    [self changeLineViewCenter:button];
    
    SegmentType segmentType = FoundType;
    switch (index) {
        case 0:
            segmentType = FoundType;
            break;
        case 1:
            segmentType = LookThingsType;
            break;
        case 2:
            segmentType = ProfileType;
            break;
        default:
            break;
    }
    if (self.segmentButtonClickBlock) {
        self.segmentButtonClickBlock(segmentType,index);
    }
    
}


- (void)updateWithIndex:(NSInteger )index {
    UIButton *button = (UIButton *)[self viewWithTag:200 + index];
    button.selected = YES;
    self.selectedButton.selected = NO;
    self.selectedButton = button;
    
    [self changeLineViewCenter:button];
    
}
/**
 *  根据角标更新线的位置
 *
 */
- (void)changeLineViewCenter:(UIButton *)selectedButon {
    CGFloat centerX = selectedButon.center.x;
    CGPoint center = self.lineView.center;
    center.x = centerX;
    [UIView animateWithDuration:0.35 animations:^{
        self.lineView.center = center;
    }];
}






@end
