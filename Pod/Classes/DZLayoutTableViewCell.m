//
//  DZLayoutTableViewCell.m
//  Pods
//
//  Created by stonedong on 15/3/24.
//
//

#import "DZLayoutTableViewCell.h"
#import "DZLayout.h"
#import "AdjustFrame.h"
@implementation DZLayoutTableViewCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {
        return self;
    }
    self.adjustHeight = 44;
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}


- (void) setLayout:(DZLayout *)layout
{
    [layout loadContentForCell:self];
    if (_layout != layout) {
        _layout = layout;
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

