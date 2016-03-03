//
//  DZTableDataSync.m
//  Pods
//
//  Created by stonedong on 15/3/24.
//
//

#import "DZTableDataSync.h"
#import <MJRefresh.h>
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
            
            NSArray* (^Images)(int begin ,int end) = ^(int begin ,int end) {
                NSMutableArray* pullingImages = [NSMutableArray new];
                for (int i = begin; i <= end; i++) {
                    NSString* name = nil;
                    if (i<10) {
                        name = [NSString stringWithFormat:@"LOGOlogo 输出_0000%d",i];
                    } else {
                        name = [NSString stringWithFormat:@"LOGOlogo 输出_000%d",i];
                    }
                    
                    UIImage* image = [UIImage imageNamed:name];
                    if (image) {
                        [pullingImages addObject:image];
                    }
                }
                return pullingImages;
            };
      
            NSArray* pullingImages = Images(0,0);
            NSArray* refreshImages = Images(0,7);

            MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(reloadData)];
            // 设置普通状态的动画图片
            [header setImages:pullingImages forState:MJRefreshStateIdle];
            // 设置即将刷新状态的动画图片（一松开就会刷新的状态）
            [header setImages:pullingImages forState:MJRefreshStatePulling];
            // 设置正在刷新状态的动画图片
            [header setImages:refreshImages duration:0.32 forState:MJRefreshStateRefreshing];
            // 隐藏时间
            header.lastUpdatedTimeLabel.hidden = YES;
            
            // 隐藏状态
            header.stateLabel.hidden = YES;
            // 设置header
            _tableViewController.tableView.mj_header = header;
 
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
    
        NSArray* (^Images)(int begin ,int end) = ^(int begin ,int end) {
            NSMutableArray* pullingImages = [NSMutableArray new];
            for (int i = begin; i <= end; i++) {
                NSString* name = nil;
                if (i<10) {
                    name = [NSString stringWithFormat:@"LOGOlogo 输出_0000%d",i];
                } else {
                    name = [NSString stringWithFormat:@"LOGOlogo 输出_000%d",i];
                }
                
                UIImage* image = [UIImage imageNamed:name];
                if (image) {
                    [pullingImages addObject:image];
                }
            }
            return pullingImages;
        };
        NSArray* idleImages = Images(8,18);
 
        CGFloat time = 0.4;
        MJRefreshGifHeader* header = (MJRefreshGifHeader*)self.tableViewController.tableView.mj_header;
        header.gifView.animationImages = idleImages;
        header.gifView.animationDuration = time;
        header.gifView.animationRepeatCount = 1;
        [header.gifView startAnimating];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_main_queue(), ^(void){
            [self.tableViewController.tableView.mj_header endRefreshing];
        });
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
    
    [self.objects each:^(DZLayout *layout) {
        layout.envController = self.tableViewController;
    }];
    
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
    if ([source isKindOfClass:[DZLayoutTableViewCell class]]) {
        NSIndexPath* indexPath  = [self.tableViewController.tableView indexPathForCell:(UITableViewCell*)source];
        DZLayout* layout = [self.objects objectAtIndexPath:indexPath];
        [layout handleEvent:event from:source inEnv:self.tableViewController];
    }
}
@end
