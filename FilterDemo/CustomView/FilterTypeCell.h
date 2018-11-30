//
//  FilterTypeCell.h
//  FilterDemo
//
//  Created by 朴子hp on 2018/11/28.
//  Copyright © 2018年 朴子hp. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FilterTypeCell : UICollectionViewCell

//滤镜展示图片
@property (weak, nonatomic) IBOutlet UIImageView *typeImageView;
//滤镜描述文字
@property (weak, nonatomic) IBOutlet UILabel *typeLab;

@end

NS_ASSUME_NONNULL_END
