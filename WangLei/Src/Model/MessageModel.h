//
//  MessageModel.h
//  WangLei
//
//  Created by 王垒 on 16/8/11.
//  Copyright © 2016年 王垒. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MessageModel : NSObject

@property (nonatomic, copy) NSString *thringName;
@property (nonatomic, copy) NSString *adress;
@property (nonatomic, copy) NSString *getTime;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, strong) NSArray *imageArray;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSString *createTime;
@property (nonatomic, copy) NSString *userIcon;
@property (nonatomic, copy) NSString *userName;



/**
 *  获取所有的信息
 */
+ (NSArray *)getAllMessageModel;



@end
