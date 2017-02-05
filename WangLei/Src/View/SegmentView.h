//
//  SegmentView.h
//  WangLei
//
//  Created by 王垒 on 16/8/11.
//  Copyright © 2016年 王垒. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, SegmentType) {
    FoundType = 0,
    LookThingsType,
    ProfileType
};

typedef void(^SegmentButtonClickBlock)(SegmentType segmentType, NSInteger index);


@interface SegmentView : UIView



/**
 *  三个按钮点击回调
 */
@property (nonatomic, copy)SegmentButtonClickBlock segmentButtonClickBlock;



/**
 *  根据角标更新线的位置
 *
 */
- (void)updateWithIndex:(NSInteger )index;


@end
