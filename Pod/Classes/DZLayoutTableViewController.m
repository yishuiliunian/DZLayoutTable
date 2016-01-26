//
//  DZLayoutTableViewController.m
//  Pods
//
//  Created by stonedong on 15/3/24.
//
//

#import "DZLayoutTableViewController.h"
#import "DZLayoutTableViewCell.h"
#import "AdjustFrame.h"
@implementation DZLayoutTableViewController
@synthesize nextEventHandler = _nextEventHandler;
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
        _dataSyncer.tableViewController = nil;
        _dataSyncer = dataSyncer;
        _dataSyncer.tableViewController = (UITableViewController*)self;
    }
}

- (void) viewDidLoad
{
    [super viewDidLoad];
    _dataSyncer.tableViewController = (UITableViewController*)self;
}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataSyncer.objects countOfObjectsAtSection:section];
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return _dataSyncer.objects.sectionCount;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DZLayout* layout = [_dataSyncer.objects objectAtIndexPath:indexPath];
    DZLayoutTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:layout.cellIdentify];
    if (!cell) {
        cell = [layout cell];
    }
    cell.layout = layout;
    cell.nextEventHandler = self;
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DZLayout* layout = [_dataSyncer.objects objectAtIndexPath:indexPath];
    return layout.cellHeight;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DZLayout* layout = [_dataSyncer.objects objectAtIndexPath:indexPath];
    [layout doActionInEnviroment:self];
}

- (void) handleEvent:(DZEvent *)event from:(id)source
{
        [self.dataSyncer handleEvent:event from:source];
}
@end

