//
//  MessageTableViewCell.m
//  WangLei
//
//  Created by 王垒 on 16/8/11.
//  Copyright © 2016年 王垒. All rights reserved.
//

#import "MessageTableViewCell.h"
#import "Masonry.h"
#import "MessageModel.h"
#import "UIImageView+WebCache.h"


@interface MessageTableViewCell ()

@property (nonatomic,strong) UILabel *thringNameLabel;
@property (nonatomic,strong) UILabel *addressLabel;
@property (nonatomic,strong) UILabel *getTimeLabel;
@property (nonatomic,strong) UILabel *contentLabel;
@property (nonatomic,strong) UILabel *statusLabel;
@property (nonatomic,strong) UILabel *createAtTimeLabel;
@property (nonatomic, strong) UIView *imageContentView;





@property (nonatomic, strong) UIImageView *userIconView;
@property (nonatomic, strong) UILabel *userNameLabel;


@end

@implementation MessageTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self coustomUI];
    }
    return  self;
}


- (void)coustomUI {
    UIView *bgView = [[UIView alloc] init];
    bgView.layer.cornerRadius = 5;
    bgView.layer.masksToBounds = YES;
    bgView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@15);
        make.bottom.right.mas_equalTo(@-15);
        make.top.mas_equalTo(@0);
    }];
    
    
    self.userIconView = [[UIImageView alloc] init];
    self.userIconView.layer.cornerRadius = 25;
    self.userIconView.layer.masksToBounds = YES;
    [bgView addSubview:self.userIconView];
    [self.userIconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@50);
        make.height.equalTo(@50);
        make.left.equalTo(@10);
        make.top.equalTo(@10);
    }];
    
    self.userNameLabel = [[UILabel alloc] init];
    self.userNameLabel.font = [UIFont systemFontOfSize:15];
    self.userNameLabel.textColor = [UIColor colorWithRed:80/255.0 green:80/255.0 blue:80/255.0 alpha:1.0];
    [bgView addSubview:self.userNameLabel];
    [self.userNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@65);
        make.top.mas_equalTo(@10);
        make.height.mas_equalTo(@50);
    }];
    
    
    UILabel *descLabel1 = [self createDescLabel:@"拾获物品:"];
    [bgView addSubview:descLabel1];
    [descLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@10);
        make.top.mas_equalTo(@65);
        make.height.mas_equalTo(@20);
    }];
    
    self.thringNameLabel = [self createLabel];
    [bgView addSubview:self.thringNameLabel];
    [self.thringNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(descLabel1.mas_right).with.offset(2);
        make.top.mas_equalTo(descLabel1.mas_top);
        make.height.mas_equalTo(descLabel1.mas_height);
    }];
    
    UILabel *descLabel2 = [self createDescLabel:@"拾获地点:"];
    [bgView addSubview:descLabel2];
    [descLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@10);
        make.top.mas_equalTo(descLabel1.mas_bottom);
        make.height.mas_equalTo(@20);
    }];
    
    self.addressLabel = [self createLabel];
    [bgView addSubview:self.addressLabel];
    [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(descLabel2.mas_right).with.offset(2);
        make.top.mas_equalTo(descLabel2.mas_top);
        make.height.mas_equalTo(descLabel2.mas_height);
    }];
    
    
    UILabel *descLabel3 = [self createDescLabel:@"拾获时间:"];
    [bgView addSubview:descLabel3];
    [descLabel3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@10);
        make.top.mas_equalTo(descLabel2.mas_bottom);
        make.height.mas_equalTo(@20);
    }];
    
    self.getTimeLabel = [self createLabel];
    [bgView addSubview:self.getTimeLabel];
    [self.getTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(descLabel3.mas_right).with.offset(2);
        make.top.mas_equalTo(descLabel3.mas_top);
        make.height.mas_equalTo(descLabel3.mas_height);
    }];
    

    self.statusLabel = [[UILabel alloc] init];
    self.statusLabel.font = [UIFont systemFontOfSize:13];
    self.statusLabel.textColor = [UIColor greenColor];
    [bgView addSubview:self.statusLabel];
    [self.statusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@10);
        make.bottom.mas_equalTo(-10);
        make.height.mas_equalTo(@20);
    }];
    
    self.createAtTimeLabel = [self createLabel];
    [bgView addSubview:self.createAtTimeLabel];
    [self.createAtTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(@-10);
        make.bottom.mas_equalTo(-10);
        make.height.mas_equalTo(@20);
    }];
    
    
    self.contentLabel = [[UILabel alloc] init];
    self.contentLabel.font = [UIFont systemFontOfSize:15];
    self.contentLabel.textColor = [UIColor colorWithRed:80/255.0 green:80/255.0 blue:80/255.0 alpha:1.0];
    self.contentLabel.numberOfLines = 0;
    [bgView addSubview:self.contentLabel];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@10);
        make.right.mas_equalTo(@-10);
        make.bottom.mas_equalTo(self.statusLabel.mas_top).with.offset(-5);
    }];
    
    
    
    self.imageContentView = [[UIView alloc] init];
    [bgView addSubview:self.imageContentView];
    self.imageContentView.backgroundColor = [UIColor whiteColor];
    [self.imageContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@10);
        make.right.mas_equalTo(@-10);
        make.top.mas_equalTo(descLabel3.mas_bottom).with.offset(5);
        make.bottom.mas_equalTo(self.contentLabel.mas_top).with.offset(-10);
    }];
    
  
}

- (UILabel *)createDescLabel:(NSString *)desc{
    UILabel *label = [[UILabel alloc] init];
    label.text = desc;
    label.font = [UIFont systemFontOfSize:13];
    label.textColor = [UIColor colorWithRed:150/255.0 green:150/255.0 blue:150/255.0 alpha:1.0];
    return  label;
}
- (UILabel *)createLabel{
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:13];
    label.textColor = [UIColor colorWithRed:180/255.0 green:180/255.0 blue:180/255.0 alpha:1.0];
    label.textAlignment = NSTextAlignmentLeft;
    return  label;
}






/**
 *  更新Cell
 */
- (void)updateWithMessageModel:(MessageModel *)model {
    NSLog(@"+++++++++++++++++%@",model);
    self.thringNameLabel.text = model.thringName;
    NSLog(@"%@",self.thringNameLabel.text);
    self.addressLabel.text = model.adress;
    self.getTimeLabel.text = model.getTime;
    self.contentLabel.text = model.content;
    self.statusLabel.text = model.status;
    self.createAtTimeLabel.text = model.createTime;
    self.userNameLabel.text = model.userName;
    [self.userIconView sd_setImageWithURL:[NSURL URLWithString:model.userIcon] placeholderImage:[UIImage imageNamed:@"header"]];
    [self.imageContentView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
    }];
    if (model.imageArray.count == 0) {
        self.imageContentView.hidden = YES;
    }else {
        self.imageContentView.hidden = NO;
        
        NSInteger total = model.imageArray.count;
        if (total > 3) {
            total = 3;
        }
        CGFloat width = ([UIScreen mainScreen].bounds.size.width - 30 - 20 - 4)/3.0;
        for (int i = 0; i < total; i++) {
            UIImageView  *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i*(2+width), 0, width, width)];
            imageView.contentMode = UIViewContentModeScaleToFill;
            imageView.clipsToBounds = YES;
            [imageView sd_setImageWithURL:[NSURL URLWithString:model.imageArray[i]]];
            [self.imageContentView addSubview:imageView];
        }
    }
}


+ (CGFloat)heightWithModel:(MessageModel *)model {
    CGFloat imageHeight;
    if (model.imageArray.count == 0) {
        imageHeight = 0;
    }else {
        imageHeight = ([UIScreen mainScreen].bounds.size.width - 30-20 - 4)/3.0;
    }
    CGFloat contentHeight = [model.content boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 30 - 20, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size.height + 5;
    
    
    CGFloat height = 5+20+20+20+5+imageHeight + 5 + 5 + 20 + 10 + contentHeight + 15 + 10 + 50;
    
    return  height;
}


@end
