//
//  DZLayoutTableViewCell.h
//  Pods
//
//  Created by stonedong on 15/3/24.
//
//

#import <UIKit/UIKit.h>
#import "DZEvent.h"
@class DZLayout;
@interface DZLayoutTableViewCell : UITableViewCell <DZEventResponser>
@property (nonatomic, strong) DZLayout* layout;
@end
