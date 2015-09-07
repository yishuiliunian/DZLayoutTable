//
//  DZAdjustTableView.m
//  Pods
//
//  Created by stonedong on 15/9/7.
//
//

#import "DZAdjustTableView.h"
#import "AdjustFrame.h"
@implementation DZAdjustTableView

- (BOOL) hintAdjustSupreView
{
    return NO;
}

- (void) handleAdjustFrame
{
    UIView* header = self.tableHeaderView;
    header.frame = CGRectMake(0, 0, CGRectGetWidth(header.frame), header.adjustHeight);
    self.tableHeaderView = header;
}

@end
