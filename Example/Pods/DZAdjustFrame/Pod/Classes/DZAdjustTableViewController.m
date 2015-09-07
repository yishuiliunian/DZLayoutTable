//
//  DZAdjustTableViewController.m
//  Pods
//
//  Created by stonedong on 15/9/7.
//
//

#import "DZAdjustTableViewController.h"

@interface DZAdjustTableViewController ()

@end

@implementation DZAdjustTableViewController
- (void) loadView
{
    _tableView = [[DZAdjustTableView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view = _tableView;
    _tableView.dataSource = self;
    _tableView.delegate = self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
