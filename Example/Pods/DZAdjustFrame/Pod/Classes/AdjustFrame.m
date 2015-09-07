//
//  AdjustFrame.m
//  LuTu
//
//  Created by stonedong on 15/5/25.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "AdjustFrame.h"
#import <objc/runtime.h>

static void* kLTAdjustFrameHeight = &kLTAdjustFrameHeight;
@implementation UIView ( AdjustFrame)

- (void) handleAdjustFrame
{
    
}
- (BOOL) hintAdjustSupreView
{
    return YES;
}
- (CGFloat) adjustHeight
{
    CGFloat height =  CGRectGetHeight(self.frame);
    NSNumber* num = objc_getAssociatedObject(self, kLTAdjustFrameHeight);
    if (num) {
        height = [num floatValue];
    }
    return height;
}

- (void) setAdjustHeight:(CGFloat)adjustHeight
{
    objc_setAssociatedObject(self, kLTAdjustFrameHeight, @(adjustHeight), OBJC_ASSOCIATION_RETAIN);
    if ([self respondsToSelector:@selector(hintAdjustSupreView)]) {
        if (![self hintAdjustSupreView]) {
            return;
        }
    }

    if ([self.superview respondsToSelector:@selector(handleAdjustFrame)]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.superview handleAdjustFrame];
        });
    }
}

@end
