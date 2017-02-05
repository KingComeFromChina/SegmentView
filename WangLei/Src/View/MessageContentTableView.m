//
//  MessageContentTableView.m
//  WangLei
//
//  Created by 王垒 on 16/8/11.
//  Copyright © 2016年 王垒. All rights reserved.
//

#import "MessageContentTableView.h"
#import "MessageModel.h"
#import "MessageTableViewCell.h"


@interface MessageContentTableView ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *messageArray;

@end

@implementation MessageContentTableView


- (NSArray *)messageArray {
    if (!_messageArray) {
        _messageArray = [MessageModel getAllMessageModel];
    }
    return _messageArray;
}



- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if (self = [super initWithFrame:frame style:style]) {
        self.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0];
        self.dataSource = self;
        self.delegate = self;
        self.rowHeight = 250;
        [self registerClass:[MessageTableViewCell class] forCellReuseIdentifier:@"cellId"];
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return self;
}




#pragma mark -
#pragma mark -UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.messageArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MessageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId" forIndexPath:indexPath];
    [cell updateWithMessageModel:self.messageArray[indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [MessageTableViewCell heightWithModel:self.messageArray[indexPath.row]];
}





@end
