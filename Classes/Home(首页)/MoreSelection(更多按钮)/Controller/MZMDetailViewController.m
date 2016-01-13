//
//  MZMDetailViewController.m
//  民之梦App
//
//  Created by 韩少龙 on 16/1/12.
//  Copyright © 2016年 韩少龙. All rights reserved.
//

#import "MZMDetailViewController.h"
#import "MZMDetailCollectionViewCell.h"
#import "MZMDetailModel.h"

@implementation MZMDetailViewController

#pragma mark - lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    UICollectionViewFlowLayout *layOut = [[UICollectionViewFlowLayout alloc] init];
    self.minView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layOut];
    [self.view addSubview:self.minView];
    self.minView.delegate = self;
    self.minView.dataSource = self;
    self.minView.backgroundColor = [UIColor whiteColor];
    [self.minView registerClass:[MZMDetailCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
}

- (void)viewWillAppear:(BOOL)animated
{

}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataAry.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MZMDetailCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    MZMDetailModel *detail = self.dataAry[indexPath.row];
    cell.titleLabel.text = detail.name;
    return cell;
}




#pragma mark - UICollectionViewDelegate 选中执行

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    //选中执行的方法
    
    
    
    
}





#pragma mark - UICollectionViewDelegateFlowLayout - 动态布局
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    return CGSizeMake(kScreenWidth  / kDetail_Item_Number - 0.5, kItem_Height);
}


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0.5;
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

#pragma mark - settersAndgetters


@end
