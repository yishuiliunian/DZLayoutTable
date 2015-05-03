//
//  DZTableDataSync.h
//  Pods
//
//  Created by stonedong on 15/3/24.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "DZLayout.h"
@interface DZTableDataSync : NSObject
{
    NSArray* _layoutObjects;
    NSInteger _currentPageIndex;
}
@property (nonatomic, weak) UITableView* tableView;
@property (nonatomic, assign, readonly) BOOL isSyncing;
@property (nonatomic, strong, readonly) NSArray* objects;
- (void) insertLayoutObject:(DZLayout*)anObject atIndex:(NSUInteger)index;
- (void) removeLayoutObjectAtIndex:(NSUInteger)index;
- (void) reloadData;
- (void) syncNextObjects;
- (DZLayout*) layoutAtIndex:(NSInteger)index;


/**
 *  增加pageIndex
 */
- (void) increasePageIndex;

/**
 *  同步状态控制,这个状态控制是可选择的，如果同步的状态不是很重要的情况下，不必加进代码中
 */
- (void) finishingSync;
- (void) startSync;

/**
 *  刷新tableview上面的数据
 *
 *  @param datas 数据
 */
- (void) finishedReloadAllData:(NSArray*)datas;
/**
 *  在拉取下一页之后刷新数据
 *
 *  @param datas layoutObject的列表
 */
- (void) finishSyncNextDatas:(NSArray*)datas;
@end
