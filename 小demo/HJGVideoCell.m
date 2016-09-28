//
//  HJGVideoCell.m
//  小demo
//
//  Created by 黄建国 on 2016/9/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "HJGVideoCell.h"
@interface HJGVideoCell()

@property (nonatomic, strong) UIImageView *image;

@property (nonatomic, strong) UILabel *titleLab;

@end

@implementation HJGVideoCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    [self firstLoad];
}

- (void)firstLoad{
    self.image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, ([UIScreen mainScreen].bounds.size.width - 45) / 2.0, 120)];
    self.image.image = [UIImage imageNamed:@"Snip20160922_2"];
    [self.contentView addSubview:self.image];
    self.titleLab = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.image.frame), CGRectGetWidth(self.image.frame), 20)];
    self.titleLab.text = @"德州基础教学一";
    self.titleLab.textColor = [UIColor blackColor];
    self.titleLab.font = [UIFont systemFontOfSize:15];
    self.titleLab.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:self.titleLab];

}
@end
