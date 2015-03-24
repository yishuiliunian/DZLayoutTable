//
//  DZTableDataSync.m
//  Pods
//
//  Created by stonedong on 15/3/24.
//
//

#import "DZTableDataSync.h"

@implementation DZTableDataSync
- (NSArray*) objects
{
    return _layoutObjects;
}

- (DZLayout*) layoutAtIndex:(NSInteger)index
{
    return _layoutObjects[index];
}
- (void) reloadData
{
    
}
@end
