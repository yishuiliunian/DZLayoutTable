//
//  DZLayout.m
//  DZLayoutTable
//
//  Created by stonedong on 15/3/24.
//  Copyright (c) 2015年 stonedong. All rights reserved.
//

#import "DZLayout.h"

@implementation DZLayout
- (instancetype) init
{
    self = [super init];
    if (!self) {
        return self;
    }
    _cellHeight = 44;
    return self;

}

- (NSString*) cellIdentify
{
    return NSStringFromClass(self.cellClass);
}
- (DZLayoutTableViewCell*) cell
{
    return [[self.cellClass alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:NSStringFromClass(self.cellClass)];
}

- (void) setDataObject:(id)dataObject
{
    if (dataObject != _dataObject) {
        _dataObject = dataObject;
        [self prepareLayout];
    }

}

- (void) prepareLayout
{
    
}

- (void) layoutTableViewCell:(UITableViewCell*)cell
{
    
}

- (void) loadContentForCell:(DZLayoutTableViewCell *)cell
{

}

- (void) doActionInEnviroment:(DZLayoutTableViewController *)tableVC
{
    
}
@end
