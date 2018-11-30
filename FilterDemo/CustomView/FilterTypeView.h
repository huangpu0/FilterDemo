//
//  FilterTypeView.h
//  FilterDemo
//
//  Created by 朴子hp on 2018/11/28.
//  Copyright © 2018年 朴子hp. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol  FilterViewDelegate <NSObject>

- (void)didSeletctedEvent:(NSInteger )tag;

@end


@interface FilterTypeView : UIView

//代理
@property (nonatomic, weak) id<FilterViewDelegate>delegate;

@end

