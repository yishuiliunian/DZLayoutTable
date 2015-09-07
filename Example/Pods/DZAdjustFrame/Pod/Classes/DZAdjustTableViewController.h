//
//  DZAdjustTableViewController.h
//  Pods
//
//  Created by stonedong on 15/9/7.
//
//

#import <UIKit/UIKit.h>
#import "DZAdjustTableView.h"
@interface DZAdjustTableViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong, readonly) DZAdjustTableView* tableView;
@end
