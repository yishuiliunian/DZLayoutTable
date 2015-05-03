//
//  DZTableDataSync.m
//  Pods
//
//  Created by stonedong on 15/3/24.
//
//

#import "DZTableDataSync.h"

@implementation DZTableDataSync

- (instancetype) init
{
    self = [super init];
    if (!self) {
        return self;
    }
    _currentPageIndex = 0;
    _isSyncing = NO;
    return self;
}
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
    NSAssert(NO, @"无需调用本类的该方法，该方法只是为了描述整个模型运作的机制，直接在子类重载就好了");
}

- (void) syncNextObjects
{
    NSAssert(NO, @"无需调用本类的该方法，该方法只是为了描述整个模型运作的机制，直接在子类重载就好了");
}
- (void) finishingSync
{
    _isSyncing = NO;
}

- (void) startSync
{
    _isSyncing = YES;
}

- (void) increasePageIndex
{
    _currentPageIndex ++;
}

- (void) finishedReloadAllData:(NSArray*)datas
{
    _layoutObjects = [datas copy];
    [self.tableView reloadData];
}

- (void) finishSyncNextDatas:(NSArray*)datas
{
    if (datas.count == 0) {
        return;
    }
    NSMutableArray* array = [_layoutObjects mutableCopy];
    NSInteger minIndex = _layoutObjects.count;
    [array addObjectsFromArray:datas];
    NSInteger maxIndex = (int)array.count ;
    _layoutObjects = array;
    
    NSMutableArray* indexPaths = [NSMutableArray new];
    for (int i = (int)minIndex;  i < maxIndex; i++) {
        NSIndexPath* path = [NSIndexPath indexPathForRow:i inSection:0];
        [indexPaths addObject:path];
    }
    if (indexPaths.count == datas.count ) {
        [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

- (void) insertLayoutObject:(DZLayout *)anObject atIndex:(NSUInteger)index
{
    if (index >= _layoutObjects.count) {
        return;
    }
    
    NSMutableArray*  insertedArray = [_layoutObjects mutableCopy];
    [insertedArray insertObject:anObject atIndex:index];
    _layoutObjects = insertedArray;
    [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:index inSection:0]] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void) removeLayoutObjectAtIndex:(NSUInteger)index
{
    if (index >= _layoutObjects.count) {
        return;
    }
    
    NSMutableArray * deletedArray = [_layoutObjects mutableCopy];
    [deletedArray removeObjectAtIndex:index];
    _layoutObjects = deletedArray;
    
    [self.tableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:index inSection:0]] withRowAnimation:UITableViewRowAnimationAutomatic];
    
}
@end
