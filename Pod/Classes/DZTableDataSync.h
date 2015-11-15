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
#import "DZSectionDataController.h"
@interface DZTableDataSync : NSObject
{
    DZSectionDataController* _layoutObjects;
    NSInteger _currentPageIndex;
}
@property (nonatomic, weak) UITableViewController* tableViewController;
@property (nonatomic, assign, readonly) BOOL isSyncing;
@property (nonatomic, strong, readonly) DZSectionDataController* objects;

/**
 *  开始重新刷新全部数据，调用父类方法将会设置同步状态为开始状态
 */
- (void) reloadData;
/**
 *  开始拉取下一页数据，调用父类方法将会这是同步状态为结束状态
 */
- (void) syncNextObjects;

/**
 *  同步状态控制
 */
- (void) finishingSync;

/**
 *  开始同步
 */
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
