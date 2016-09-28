//
//  backView.m
//  小demo
//
//  Created by 黄建国 on 2016/9/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "backView.h"
#import "backHeadView.h"
#import "HJGVideoCollectionView.h"
#import "HJGCareerView.h"
#import "HJGClassView.h"

@interface backView()<UITableViewDelegate, UITableViewDataSource>
/*tab*/
@property(nonatomic,strong) UITableView  * backTab;

@property (nonatomic, strong) backHeadView *backHeadView;

@property (nonatomic, strong) HJGVideoCollectionView *videoCollectionView;

@property (nonatomic, strong) HJGCareerView *careerView;

@property (nonatomic, strong) HJGClassView *classView;

@property (nonatomic, assign) NSInteger currentPage;

@property (nonatomic, assign) CGFloat currentHeight;

@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation backView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }

    return self;
}

#pragma mark - 创建界面
- (void)setupUI{
    [self firstLoad];
}

#pragma mark - 初始化
- (void)firstLoad{
    self.backTab = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    self.backTab.delegate = self;
    self.backTab.dataSource = self;
    [self addSubview:self.backTab];
    self.backHeadView = [[backHeadView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height * (1190.0 / 3233.0))];
    self.videoCollectionView = [[HJGVideoCollectionView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 1000)];
    self.careerView = [[HJGCareerView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 1000)];
    self.classView = [[HJGClassView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 1000)];
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 1000)];
    self.scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width * 3, 1000);
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.scrollEnabled = YES;
    self.scrollView.backgroundColor = [UIColor whiteColor];
    for (int i = 0; i < 3 ; i ++) {
        if (i == 0) {
            [self.scrollView addSubview:self.careerView];
        }else if(i == 1){
            self.videoCollectionView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width, 0, [UIScreen mainScreen].bounds.size.width, 1000);
            [self.scrollView addSubview:self.videoCollectionView];
        }else{
            self.classView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width * 2, 0, [UIScreen mainScreen].bounds.size.width, 1000);
            [self.scrollView addSubview:self.classView];
        }
    }
}

#pragma mark - tableViewDataSourse and delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }else{
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId ];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell addSubview:self.scrollView];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 1000;

}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return [UIScreen mainScreen].bounds.size.height * (1190.0 / 3233.0);
    }else{
        return 30;
    }

}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return self.backHeadView;
    }else{
        return [self menuView];
    }
}

#pragma mark - 按钮菜单
- (UIView *)menuView{
    NSArray * itemArr = @[@"生涯",@"视频",@"课程"];
    UIView *menuView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 30)];
    menuView.backgroundColor = [UIColor whiteColor];
    for (int i =0 ; i < 3; i ++) {
        UIButton *but = [[UIButton alloc]initWithFrame:CGRectMake(i * [UIScreen mainScreen].bounds.size.width / 3.0, 0, [UIScreen mainScreen].bounds.size.width / 3.0, 30)];
        but.tag = i;
        [but setTitle:itemArr[i] forState:UIControlStateNormal];
        [but addTarget:self action:@selector(menueButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        but.titleLabel.font = [UIFont systemFontOfSize:20];
        but.backgroundColor = [UIColor whiteColor];
        [but setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        but.backgroundColor = [UIColor redColor];
        [menuView addSubview:but];
    }
    return menuView;
}

- (void) menueButtonClick:(UIButton *)sender{
    self.currentPage = sender.tag;
    self.scrollView.contentOffset = CGPointMake([UIScreen mainScreen].bounds.size.width *sender.tag, 0);
    switch (sender.tag) {
        case 0 || nil:
            NSLog(@"点击了生涯按钮");
            break;
        case 1:
            NSLog(@"点击了视频按钮");
            break;
            
        case 2:
            NSLog(@"点击了课程按钮");
            break;
        default:
            break;
    }


}
@end
