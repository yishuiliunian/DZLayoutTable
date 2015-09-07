//
//  DZGrowImageView.m
//  LuTu
//
//  Created by stonedong on 15/6/8.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "DZGrowImageView.h"
@interface DZGrowImageView ()
{
    BOOL _needUpdateAdjustHeight;
}
@end

@implementation DZGrowImageView

- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) {
        return self;
    }
    _needUpdateAdjustHeight = YES;
    _adjustImageSize = CGSizeMake(0, 0);
    self.layer.masksToBounds = YES;
    return self;
}

- (void) setImage:(UIImage *)image
{
    [super setImage:image];
    _needUpdateAdjustHeight = YES;
    [self setNeedsLayout];
}


- (void) layoutSubviews
{
    [super layoutSubviews];
    if (_needUpdateAdjustHeight) {
        if (!self.image ||  self.image.size.width < 1 || self.image.size.height < 1) {
            self.adjustHeight = 0;
        } else {
            CGSize imageSize = self.image.size;
            imageSize = CGSizeMake(imageSize.width/2, imageSize.height/2);
            CGFloat height = 0;
            
            CGFloat width = CGRectGetWidth(self.bounds);
            if (width == 0) {
                width = 1000;
            }
            height = imageSize.height* CGRectGetWidth(self.bounds) / imageSize.width;
            self.adjustHeight = height;
        }
        _needUpdateAdjustHeight = NO;
    }
}

@end
