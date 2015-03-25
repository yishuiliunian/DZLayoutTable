//
//  DZLayout.m
//  DZLayoutTable
//
//  Created by stonedong on 15/3/24.
//  Copyright (c) 2015年 stonedong. All rights reserved.
//

#import "DZLayout.h"

@implementation DZLayout

- (NSString*) cellIdentify
{
    return NSStringFromClass(self.cellClass);
}
- (DZLayoutTableViewCell*) cell
{
    return [[self.cellClass alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:NSStringFromClass(self.cellClass)];
}
- (void) layoutItems
{
    
}

- (void) layoutTableViewCell:(UITableViewCell*)cell
{
    
}

- (void) loadContentForCell:(DZLayoutTableViewCell *)cell
{
    
}
@end
