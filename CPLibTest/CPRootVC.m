//
//  CPRootVC.m
//  CPLibTest
//
//  Created by wangzhangchuan on 2017/12/18.
//  Copyright © 2017年 wangzhangchuan. All rights reserved.
//

#import "CPRootVC.h"

@interface CPRootVC () {
}

@property (nonatomic, strong) NSArray <NSDictionary *> *configureDicts;

@end

@implementation CPRootVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self initializedBaseProperties];
}

- (void)initializedBaseProperties {
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"CPConfigure" ofType:@"plist"];
    self.configureDicts = [[NSArray alloc] initWithContentsOfFile:path];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.configureDicts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"CellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    NSDictionary *dict = self.configureDicts[indexPath.row];
    cell.textLabel.text = dict[@"Des"];
    // Configure the cell...
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSDictionary *dict = self.configureDicts[indexPath.row];
    
    Class c = NSClassFromString(dict[@"ClassName"]);
    
    UIViewController *vc = c.new;
    vc.view.backgroundColor = UIColor.whiteColor;
    
    [self.navigationController pushViewController:vc animated:YES];
}

@end
