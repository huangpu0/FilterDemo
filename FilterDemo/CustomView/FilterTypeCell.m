//
//  FilterTypeCell.m
//  FilterDemo
//
//  Created by 朴子hp on 2018/11/28.
//  Copyright © 2018年 朴子hp. All rights reserved.
//

#import "FilterTypeCell.h"

@implementation FilterTypeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.typeImageView.layer.cornerRadius = 55.0f/2;
    self.typeImageView.layer.masksToBounds = YES;
    
}

- (void)setSelected:(BOOL)selected{
    [super setSelected:selected];
    
    if (selected) {
       self.typeLab.textColor = [UIColor redColor];
    }else{
       self.typeLab.textColor = [UIColor blackColor];
    }
    
}
@end
