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
    self.tableView= [[DZAdjustTableView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view = self.tableView;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableFooterView = [UIView new];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
