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
@property (nonatomic, strong) DZModel* model;
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
- (void) setModel:(DZModel *)model
{
    if (_model != model) {
        _model = model;
        [self layoutItems];
    }
}
- (void) layoutItems
{
    [super layoutItems];
}
- (void) layoutTableViewCell:(UITableViewCell *)cell
{
    [super layoutTableViewCell:cell];
}
@end


@interface DZTableViewCell : UITableViewCell
{
    DZLayout* _layout;
}
@end

@implementation DZTableViewCell

- (void) setLayoutObject:(DZLayout *)layout
{
    if (_layout != layout) {
        _layout = layout;
        [self setNeedsLayout];
    }
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    [_layout layoutTableViewCell:self];
}

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
        layout.model = model;
        [array addObject:layout];
    }
    _layoutObjects = array;
    [self.tableView reloadData];
}
@end
