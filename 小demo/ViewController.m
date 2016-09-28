//
//  ViewController.m
//  小demo
//
//  Created by 黄建国 on 2016/9/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ViewController.h"
#import "backView.h"
@interface ViewController ()

@property (nonatomic, strong) backView *backView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self firstLoad];
}

#pragma mark - 初始化
- (void)firstLoad{
    self.view.backgroundColor = [UIColor whiteColor];
    self.backView = [[backView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [self.view addSubview:self.backView];

}



@end
