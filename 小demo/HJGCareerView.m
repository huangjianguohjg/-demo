//
//  HJGCareerView.m
//  小demo
//
//  Created by 黄建国 on 2016/9/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "HJGCareerView.h"
@interface HJGCareerView()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *careerTab;

@end
@implementation HJGCareerView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

#pragma mark - 创建UI   973877860549
- (void)setupUI{
    [self firstLoad];
}

- (void)firstLoad{
    self.careerTab = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 1000)];
    self.careerTab.delegate = self;
    self.careerTab.dataSource = self;
    self.careerTab.scrollEnabled = NO;
    [self addSubview:self.careerTab];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"这是第%ld个生涯",indexPath.row];
    return cell;
}

@end
