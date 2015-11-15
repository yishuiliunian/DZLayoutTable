//
//  DZTestSyncer.m
//  DZLayoutTable
//
//  Created by stonedong on 15/3/24.
//  Copyright (c) 2015年 stonedong. All rights reserved.
//

#import "DZTestSyncer.h"
@interface DZModel :NSObject
@property (nonatomic, strong) NSString* title;
@property (nonatomic, strong) NSString* content;
@end

@implementation DZModel


@end

@interface DZTestLayout : DZLayout
@property (nonatomic, strong) UIFont* titleFont;
@end

@implementation DZTestLayout

- (instancetype) init
{
    self = [super init];
    if (!self) {
        return self;
    }
    return self;
}

- (void) loadContentForCell:(DZLayoutTableViewCell *)cell
{
    DZModel* model = (DZModel*)self.dataObject;
    cell.textLabel.text = model.title;
}

- (void) doActionInEnviroment:(DZLayoutTableViewController *)tableVC
{
    NSLog(@"cell taped");
}
@end


@interface DZTableViewCell : DZLayoutTableViewCell

@end

@implementation DZTableViewCell
@end


@interface DZTestSyncer ()
@end
@implementation DZTestSyncer
- (void) reloadData
{
    [super reloadData];
    NSMutableArray* array = [NSMutableArray new];
    for (int i = 0; i < 10; i++) {
        DZTestLayout* layout = [DZTestLayout new];
        layout.cellClass = [DZTableViewCell class];
        DZModel* model = [DZModel new];
        layout.cellWidth = 300;
        model.title = @"xxx";
        model.content = @"xxx";
        layout.dataObject = model;
        [array addObject:layout];
    }
    [self finishedReloadAllData:@[array]];
}
@end
