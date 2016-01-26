//
//  DZLayoutTableViewController.h
//  Pods
//
//  Created by stonedong on 15/3/24.
//
//

#import <UIKit/UIKit.h>
#import "DZTableDataSync.h"
#import "DZAdjustTableViewController.h"
#import "DZEvent.h"
@interface DZLayoutTableViewController : DZAdjustTableViewController <DZEventResponser>
@property (nonatomic, strong) DZTableDataSync* dataSyncer;
- (instancetype) initWithSyncer:(DZTableDataSync*)syncer;
@end
