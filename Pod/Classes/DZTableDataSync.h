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
/**
 *  开始重新刷新全部数据，调用父类方法将会设置同步状态为开始状态
 */
- (void) reloadData;
/**
 *  开始拉取下一页数据，调用父类方法将会这是同步状态为结束状态
 */
- (void) syncNextObjects;
- (DZLayout*) layoutAtIndex:(NSInteger)index;


/**
 *  增加pageIndex
 */
- (void) increasePageIndex;

/**
 *  同步状态控制
 */
- (void) finishingSync;
- (void) startSync;

/**
 *  刷新tableview上面的数据，同时设置同步状态为结束状态
 *
 *  @param datas 数据
 */
- (void) finishedReloadAllData:(NSArray*)datas;
/**
 *  在拉取下一页之后刷新数据，同时设置同步状态为结束状态
 *
 *  @param datas layoutObject的列表
 */
- (void) finishSyncNextDatas:(NSArray*)datas;
@end
