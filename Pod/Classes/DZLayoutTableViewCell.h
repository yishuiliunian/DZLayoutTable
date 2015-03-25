//
//  DZLayoutTableViewCell.h
//  Pods
//
//  Created by stonedong on 15/3/24.
//
//

#import <UIKit/UIKit.h>
@class DZLayout;
@interface DZLayoutTableViewCell : UITableViewCell
@property (nonatomic, strong) DZLayout* layout;
- (void) didLayoutChanged:(DZLayout*)layout;
@end
