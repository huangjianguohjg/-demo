//
//  HJGVideoCollectionView.m
//  小demo
//
//  Created by 黄建国 on 2016/9/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "HJGVideoCollectionView.h"
#import "HJGVideoCell.m"
@interface HJGVideoCollectionView()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *videoCollection;

@end

@implementation HJGVideoCollectionView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self =[super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    [self firstLoad];
    
}

- (void)firstLoad{
    self.backgroundColor = [UIColor whiteColor];
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.minimumInteritemSpacing = 15;
    layout.minimumLineSpacing = 15;
    self.videoCollection = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 1000) collectionViewLayout:layout];
    self.videoCollection.delegate = self;
    self.videoCollection.dataSource = self;
    self.videoCollection.backgroundColor = [UIColor whiteColor];
    self.videoCollection.scrollEnabled = NO;
    [self.videoCollection registerClass:[HJGVideoCell class] forCellWithReuseIdentifier:videoId];
    [self addSubview:self.videoCollection];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 11;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HJGVideoCell *cell = (HJGVideoCell *)[collectionView dequeueReusableCellWithReuseIdentifier:videoId forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake( ([UIScreen mainScreen].bounds.size.width - 45) / 2.0, 140);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(7, 7, 7, 7);
}

@end
