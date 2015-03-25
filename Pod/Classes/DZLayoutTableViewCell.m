//
//  DZLayoutTableViewCell.m
//  Pods
//
//  Created by stonedong on 15/3/24.
//
//

#import "DZLayoutTableViewCell.h"
#import "DZLayout.h"
@implementation DZLayoutTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void) didLayoutChanged:(DZLayout *)layout
{
    
}
- (void) setLayout:(DZLayout *)layout
{
    if (_layout != layout) {
        _layout = layout;
        [_layout loadContentForCell:self];
        [self didLayoutChanged:layout];
        [self setNeedsLayout];
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    [self.layout layoutTableViewCell:self];
}
@end

