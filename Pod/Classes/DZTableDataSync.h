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
}
@property (nonatomic, weak) UITableView* tableView;
@property (nonatomic, strong, readonly) NSArray* objects;
- (void) insertLayoutObject:(DZLayout*)anObject atIndex:(NSUInteger)index;
- (void) removeLayoutObject:(DZLayout*)anObject atIndex:(NSUInteger)index;
- (void) reloadData;
- (void) syncNextObjects;
- (DZLayout*) layoutAtIndex:(NSInteger)index;
@end
