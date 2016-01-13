//
//  MZMDetailViewController.h
//  民之梦App
//
//  Created by 韩少龙 on 16/1/12.
//  Copyright © 2016年 韩少龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MZMDetailViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,
UICollectionViewDelegateFlowLayout>

@property (nonatomic, retain) NSMutableArray *dataAry;
@property (nonatomic, retain) UICollectionView *minView;

@end
