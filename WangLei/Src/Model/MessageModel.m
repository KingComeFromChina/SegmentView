//
//  MessageModel.m
//  WangLei
//
//  Created by 王垒 on 16/8/11.
//  Copyright © 2016年 王垒. All rights reserved.
//

#import "MessageModel.h"
#import "YYModel.h"


@implementation MessageModel


/**
 *  获取所有的信息
 */
+ (NSArray *)getAllMessageModel {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"message" ofType:@".json"];
    id json = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:path] options:NSJSONReadingMutableContainers error:nil];
    NSArray *array = [NSArray yy_modelArrayWithClass:[MessageModel class] json:json];
    
    
    
    
    return  array;
}


@end
