//
//  FilterTypeView.m
//  FilterDemo
//
//  Created by 朴子hp on 2018/11/28.
//  Copyright © 2018年 朴子hp. All rights reserved.
//

#import "FilterTypeView.h"
#import "FilterTypeCell.h"

@interface FilterTypeView ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (strong, nonatomic) NSMutableArray *styleArray;

@end
@implementation FilterTypeView

- (NSMutableArray *)styleArray{
    
    if (!_styleArray) {
        _styleArray = [[NSMutableArray alloc]initWithObjects:@"正常",@"伽马线",@"反色",@"褐色-怀旧",@"高斯模糊",@"素描",@"卡通",@"凹面镜",@"哈哈镜",@"水晶球", nil];
    }
    return _styleArray;
}

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        [self setUpContentView];
    }
    return self;
}

#pragma mark - 内容视图
- (void)setUpContentView{
    
    self.layer.cornerRadius = 8.0;
    self.layer.masksToBounds = YES;
    
    //标题
    UILabel *titleLab = [[UILabel alloc]init];
    titleLab.backgroundColor = kHexOfColor(0xB064D6);
    titleLab.textAlignment = NSTextAlignmentCenter;
    titleLab.frame = CGRectMake(0, 0, kScreenW, 45);
    titleLab.text = @"滤镜样式选择";
    titleLab.font = [UIFont boldSystemFontOfSize:16.0f];
    [self addSubview:titleLab];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(55, 80);
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 25, 0, 25);
    flowLayout.minimumLineSpacing = 10;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 45, kScreenW, 100) collectionViewLayout:flowLayout];
    collectionView.showsHorizontalScrollIndicator = NO;
    collectionView.alwaysBounceHorizontal = YES;
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    [collectionView registerNib:[UINib nibWithNibName:@"FilterTypeCell" bundle:nil] forCellWithReuseIdentifier:@"filterCell"];
    [self addSubview:collectionView];
    
    UIButton *saveBtn = [[UIButton alloc]init];
    saveBtn.tag = 100;
    saveBtn.frame = CGRectMake(0, 145, kScreenW, 45);
    saveBtn.backgroundColor = kHexOfColor(0xB064D6);
    saveBtn.titleLabel.font = [UIFont boldSystemFontOfSize:16.0f];
    [saveBtn setTitle:@"保存" forState:UIControlStateNormal];
    [saveBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [saveBtn addTarget:self action:@selector(saveEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:saveBtn];
}

#pragma mark <UICollectionViewDataSource>
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.styleArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString * const reuseIdentifier = @"filterCell";
    FilterTypeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    if (!cell) {
        cell = [[FilterTypeCell alloc]init];
    }
    if (indexPath.row == 0) {//指定第一个为选中状态
        [collectionView selectItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0] animated:NO scrollPosition:UICollectionViewScrollPositionNone];
        cell.selected = YES;
    }
    cell.typeLab.text = self.styleArray[indexPath.row];
    cell.typeImageView.image = [UIImage imageNamed:self.styleArray[indexPath.row]];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.delegate respondsToSelector:@selector(didSeletctedEvent:)]) {
        [self.delegate didSeletctedEvent:indexPath.row];
    }
}
//保存图片
- (void)saveEvent:(UIButton *)btn{
    if ([self.delegate respondsToSelector:@selector(didSeletctedEvent:)]) {
        [self.delegate didSeletctedEvent:btn.tag];
    }
}

@end
