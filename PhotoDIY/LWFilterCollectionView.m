//
//  LWFilterCollectionView.m
//  PhotoDIY
//
//  Created by luowei on 16/7/5.
//  Copyright © 2016年 wodedata. All rights reserved.
//

#import "LWFilterCollectionView.h"
#import "LWFilterManager.h"
#import "PDDrawView.h"
#import "Categorys.h"

@implementation LWFilterCollectionView{
    NSIndexPath *_selectedIndexPath;
}

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {

    }

    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];

    self.dataSource = self;
    self.delegate = self;
}

- (void)setHidden:(BOOL)hidden {
    [super setHidden:hidden];
    self.topLine.hidden = hidden;
}

//重新加载Filters
-(void)reloadFilters{
    self.filterDict = [LWFilterManager filters];
    [self reloadData];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if(self.filterDict && self.filterDict.count > 0){
        return self.filterDict.allKeys.count;
    }else{
        return 0;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LWFilterCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LWFilterCollectionCell" forIndexPath:indexPath];
    cell.titleLbl.text = self.filterDict.allKeys[indexPath.item];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    LWFilterCollectionCell *cel = (LWFilterCollectionCell *)cell;
    if(_selectedIndexPath != nil && _selectedIndexPath.item == indexPath.item){
        cel.selectIcon.hidden = NO;
        [collectionView selectItemAtIndexPath:indexPath animated:NO scrollPosition:UICollectionViewScrollPositionNone];
    }else{
        cel.selectIcon.hidden = YES;
        [collectionView deselectItemAtIndexPath:indexPath animated:NO];
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    LWFilterCollectionCell *cell = (LWFilterCollectionCell *)[collectionView cellForItemAtIndexPath:indexPath];
    [collectionView selectItemAtIndexPath:indexPath animated:YES scrollPosition:UICollectionViewScrollPositionNone];
    cell.selected = YES;
    cell.selectIcon.hidden = NO;
    _selectedIndexPath = indexPath;

    PDDrawView *drawView = [self superViewWithClass:[PDDrawView class]];

}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    LWFilterCollectionCell *cell = (LWFilterCollectionCell *)[collectionView cellForItemAtIndexPath:indexPath];
    [collectionView deselectItemAtIndexPath:indexPath animated:NO];
    cell.selected = NO;
    cell.selectIcon.hidden = YES;
}


@end


@implementation LWFilterCollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.imageView = (UIImageView *)[self viewWithTag:101];
    self.titleLbl = (UILabel *)[self viewWithTag:102];
}


@end
