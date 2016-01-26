//
//  DZTableDataSync.m
//  Pods
//
//  Created by stonedong on 15/3/24.
//
//

#import "DZTableDataSync.h"

@interface DZTableDataSync ()
@end


@implementation DZTableDataSync

- (instancetype) init
{
    self = [super init];
    if (!self) {
        return self;
    }
    _currentPageIndex = 0;
    _isSyncing = NO;
    _objects = [DZSectionDataController new];
    _usingPullDownRefresh = YES;
    return self;
}

- (void) setTableViewController:(UITableViewController *)tableViewController
{
    if (tableViewController != _tableViewController) {
        _tableViewController = tableViewController;
        if (_usingPullDownRefresh) {
            UIRefreshControl* control = [[UIRefreshControl alloc] init];
            [control addTarget:self action:@selector(reloadData) forControlEvents:UIControlEventValueChanged];
            _tableViewController.refreshControl = control;
        } else {
            _tableViewController.refreshControl = nil;
        }

    }
}

- (void) reloadData
{
    [self startSync];
}

- (void) syncNextObjects
{
    [self startSync];
}
- (void) finishingSync
{
    _isSyncing = NO;
    [self.tableViewController.refreshControl endRefreshing];
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
    [self.objects  updateAllObjects:datas];
    [self.tableViewController.tableView reloadData];
    [self finishingSync];
}

- (void) finishSyncNextDatas:(NSArray*)datas
{
    [self.tableViewController.tableView reloadData];
    [self finishingSync];
}

- (void) handleEvent:(DZEvent *)event from:(id)source
{
    
}
@end
