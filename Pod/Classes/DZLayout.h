//
//  DZLayout.h
//  DZLayoutTable
//
//  Created by stonedong on 15/3/24.
//  Copyright (c) 2015年 stonedong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@protocol DZTableViewCellInterface;
@interface DZLayout : NSObject
@property (nonatomic, assign) CGFloat cellWidth;
@property (nonatomic, assign, readonly) CGFloat cellHeight;
@property (nonatomic, strong) Class cellClass;
@property (nonatomic, strong, readonly) NSString* cellIdentify;
- (void) layoutItems;
- (UITableViewCell<DZTableViewCellInterface>*) cell;
- (void) layoutTableViewCell:(UITableViewCell*)cell;
@end
