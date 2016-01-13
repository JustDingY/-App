//
//  MZMCollectionViewCell.h
//  民之梦App
//
//  Created by 韩少龙 on 16/1/12.
//  Copyright © 2016年 韩少龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MZMCollectionViewCell : UICollectionViewCell

@property (nonatomic, retain) UIImageView * imgView;
@property (nonatomic, retain) UILabel * titleLabel;
@property (nonatomic, assign) BOOL isHiddened;

@end
