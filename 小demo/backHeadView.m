//
//  backHeadView.m
//  小demo
//
//  Created by 黄建国 on 2016/9/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "backHeadView.h"
@interface backHeadView()
//头部背景图片
@property (nonatomic, strong) UIImageView *backHeadImage;
//头部图片
@property (nonatomic, strong) UIImageView *headImage;
//名字
@property (nonatomic, strong) UILabel *name;
//粉丝数
@property (nonatomic, strong) UILabel *fansCount;

@end

@implementation backHeadView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

#pragma mark - 创建UI
- (void)setupUI{
    [self firsrLoad];

}
#pragma mark - 初始化UI控件
- (void)firsrLoad{
    self.backHeadImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height * (1190.0 / 3233.0))];
    self.backHeadImage.image = [UIImage imageNamed:@"coach_bg"];
    [self addSubview:self.backHeadImage];
    self.headImage = [[UIImageView alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2.0 - 30, 50, 60, 60)];
    self.headImage.image = [UIImage imageNamed:@"Snip20160922_1"];
    self.name = [[UILabel alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2.0 - 50, CGRectGetMaxY(self.headImage.frame) + 7, 100, 30)];
    self.name.textColor = [UIColor whiteColor];
    self.name.text = @"陈光诚";
    self.name.font = [UIFont systemFontOfSize:20];
    self.name.textAlignment = NSTextAlignmentCenter;
    self.fansCount = [[UILabel alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2.0 - 30, CGRectGetMaxY(self.name.frame) + 10, 60, 20)];
    self.fansCount.textAlignment = NSTextAlignmentCenter;
    self.fansCount.text = [NSString stringWithFormat:@"粉丝 0"];
    self.fansCount.font = [UIFont systemFontOfSize:15];
    self.fansCount.textColor = [UIColor whiteColor];
    [self.backHeadImage addSubview:self.headImage];
    [self.backHeadImage addSubview:self.name];
    [self.backHeadImage addSubview:self.fansCount];
}

@end
