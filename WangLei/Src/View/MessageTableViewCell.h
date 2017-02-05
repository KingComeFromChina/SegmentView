//
//  MessageTableViewCell.h
//  WangLei
//
//  Created by 王垒 on 16/8/11.
//  Copyright © 2016年 王垒. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MessageModel;
@interface MessageTableViewCell : UITableViewCell

/**
 *  更新Cell
 */
- (void)updateWithMessageModel:(MessageModel *)model;

//计算高度
+ (CGFloat)heightWithModel:(MessageModel *)model;

@end
