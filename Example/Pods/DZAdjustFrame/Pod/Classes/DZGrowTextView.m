//
//  DZGrowTextView.m
//  Pods
//
//  Created by stonedong on 15/7/16.
//
//

#import "DZGrowTextView.h"

@interface DZGrowTextView ()
{
    CGFloat _needUpdateTextHeight;
}
@end

@implementation DZGrowTextView


- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) {
        return self;
    }
    _needUpdateTextHeight = YES;
    return self;
}
- (void) setText:(NSString *)text
{
    [super setText:text];
    _needUpdateTextHeight = YES;
}
- (void) setFont:(UIFont *)font
{
    [super setFont:font];
    _needUpdateTextHeight = YES;
}
- (void) setFrame:(CGRect)frame
{
    [super setFrame:frame];
    if (!CGRectEqualToRect(self.frame, frame)) {
        _needUpdateTextHeight = YES;
    }
}
- (void) layoutSubviews
{
    [super layoutSubviews];
    if (_needUpdateTextHeight) {
        if (self.text) {
            CGSize size = [self.text sizeWithFont:self.font constrainedToSize:CGSizeMake(CGRectGetWidth(self.bounds), CGFLOAT_MAX)];
            self.adjustHeight= size.height + 15;
        } else {
            self.adjustHeight = CGRectGetHeight(self.bounds);
        }
        _needUpdateTextHeight = NO;
    }
}

@end
