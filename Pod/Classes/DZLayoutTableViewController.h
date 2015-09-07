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
@interface DZLayoutTableViewController : DZAdjustTableViewController
@property (nonatomic, strong) DZTableDataSync* dataSyncer;
- (instancetype) initWithSyncer:(DZTableDataSync*)syncer;
@end
