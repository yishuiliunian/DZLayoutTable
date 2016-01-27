//
//  DZLayout.h
//  DZLayoutTable
//
//  Created by stonedong on 15/3/24.
//  Copyright (c) 2015年 stonedong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "DZLayoutTableViewCell.h"
@class DZLayoutTableViewController;
@interface DZLayout : NSObject
@property (nonatomic, weak) UITableViewController* envController;
@property (nonatomic, assign) CGFloat cellWidth;
@property (nonatomic, assign) CGFloat cellHeight;
@property (nonatomic, strong) Class cellClass;
@property (nonatomic, strong, readonly) NSString* cellIdentify;
@property (nonatomic, strong) id dataObject;

- (void) prepareLayout;
- (DZLayoutTableViewCell*) cell;
- (void) layoutTableViewCell:(DZLayoutTableViewCell*)cell;
- (void) loadContentForCell:(DZLayoutTableViewCell*)cell;
- (void) doActionInEnviroment:(DZLayoutTableViewController*)tableVC;
- (void) handleEvent:(DZEvent*)event from:(DZLayoutTableViewCell*)cell inEnv:(UIViewController*)vc;
@end
