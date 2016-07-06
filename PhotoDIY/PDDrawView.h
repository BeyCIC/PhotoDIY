//
//  PDDrawView.h
//  PhotoDIY
//
//  Created by luowei on 16/7/4.
//  Copyright © 2016年 wodedata. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GPUImage/GPUImage.h>
#import "PDPhotoLibPicker.h"

@class LWFilterCollectionView;
@class LWPhotoCollectionView;

@interface PDDrawView : UIView<PDPhotoPickerProtocol>

@property(nonatomic,strong) IBOutlet GPUImageView *gpuImageView;
@property(nonatomic,strong) IBOutlet LWFilterCollectionView *filterCollectionView;
@property(nonatomic,strong) IBOutlet LWPhotoCollectionView *photoCollectionView;

@property(nonatomic,strong) IBOutlet NSLayoutConstraint *gpuImgPaddingBottomZero;
@property(nonatomic,strong) IBOutlet NSLayoutConstraint *gpuImgPaddingPhotosCollectionV;
@property(nonatomic,strong) IBOutlet NSLayoutConstraint *gpuImgPaddingFiltersCollectionV;


@property(nonatomic,strong) GPUImagePicture *sourcePicture;
@property(nonatomic,strong) GPUImageOutput<GPUImageInput> *filter;

//加载默认图片
- (void)loadDefaultImage;

//加载照片
- (void)showPhotos;

//加载滤镜
-(void)showFilters;

@end
