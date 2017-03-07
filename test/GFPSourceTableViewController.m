//
//  GFPSourceTableViewController.m
//  test
//
//  Created by yanzhen on 17/3/6.
//  Copyright © 2017年 v2tech. All rights reserved.
//

#import "GFPSourceTableViewController.h"
#import "GFPAssetGroupsTableViewController.h"

@interface GFPSourceTableViewController ()

@end

@implementation GFPSourceTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancel)];
    self.tableView.rowHeight = 64;
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_8_4
    if ([self.tableView respondsToSelector:@selector(setCellLayoutMarginsFollowReadableWidth:)]) {
        self.tableView.cellLayoutMarginsFollowReadableWidth = NO;
    }
#endif
}

- (void)cancel{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * cellIdentifier = @"sourcTypeCell";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        //cell = [[[NSBundle mainBundle] loadNibNamed:@"GFPSouceTypeTableViewCell" owner:nil options:nil] lastObject];
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    if (indexPath.row == 0) {
        cell.textLabel.text = NSLocalizedString(@"本地文件", nil);
    }
    
    if (indexPath.row == 1) {
        cell.textLabel.text = NSLocalizedString(@"相册", nil);
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 1) {
        GFPAssetGroupsTableViewController *vc = [[GFPAssetGroupsTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
        [self.navigationController pushViewController:vc animated:YES];
    }
}


@end
