//
//  DZLayoutTableViewController.m
//  Pods
//
//  Created by stonedong on 15/3/24.
//
//

#import "DZLayoutTableViewController.h"
#import "DZLayoutTableViewCell.h"
@implementation DZLayoutTableViewController
- (instancetype) initWithSyncer:(DZTableDataSync *)syncer
{
    self = [super initWithNibName:nil bundle:nil];
    if (!self) {
        return self;
    }
    _dataSyncer = syncer;
    return self;
}

- (void) setDataSyncer:(DZTableDataSync *)dataSyncer
{
    if (_dataSyncer != dataSyncer) {
        _dataSyncer = dataSyncer;
        _dataSyncer.tableView = self.tableView;
    }
}

- (void) viewDidLoad
{
    [super viewDidLoad];
    _dataSyncer.tableView = self.tableView;
}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataSyncer.objects.count;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DZLayout* layout = [_dataSyncer layoutAtIndex:indexPath.row];
    DZLayoutTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:layout.cellIdentify];
    if (!cell) {
        cell = [layout cell];
    }
    cell.layout = layout;
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DZLayout* layout = [_dataSyncer layoutAtIndex:indexPath.row];
    return layout.cellHeight;
}
@end

