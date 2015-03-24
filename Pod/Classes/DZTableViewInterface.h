//
//  DZTableViewInterface.h
//  DZLayoutTable
//
//  Created by stonedong on 15/3/24.
//  Copyright (c) 2015年 stonedong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DZLayout.h"
@protocol DZTableViewCellInterface <NSObject>
- (void) setLayoutObject:(DZLayout*)layout;
@end
