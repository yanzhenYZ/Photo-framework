//
//  GFPAssetsTableViewController.m
//  test
//
//  Created by yanzhen on 17/3/7.
//  Copyright © 2017年 v2tech. All rights reserved.
//

#import "GFPAssetsTableViewController.h"
#import "GFPFilesTableViewCell.h"

@interface GFPAssetsTableViewController ()
@property (nonatomic, strong) PHFetchResult<PHAsset *> *assets;
@end

@implementation GFPAssetsTableViewController

- (instancetype)initWithAssetCollection:(PHAssetCollection *)assetCollection{
    self  = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        self.title = assetCollection.localizedTitle;
        
        PHFetchOptions *options = [[PHFetchOptions alloc] init];
        options.sortDescriptors = @[[[NSSortDescriptor alloc] initWithKey:@"creationDate" ascending:YES]];
        _assets = [PHAsset fetchAssetsInAssetCollection:assetCollection options:options];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 65;
    
}

#pragma mark - tableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _assets.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GFPFilesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GFPFilesTableViewCell"];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"GFPFilesTableViewCell" owner:self options:nil].lastObject;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.backgroundColor = indexPath.row % 2 ? YZColor(232, 240, 249) : [UIColor whiteColor];
    PHAsset *asset = self.assets[indexPath.row];
//    BOOL isSelected = [self.picker isAssetPicked:asset];
    [cell configureWithAsset:asset isSelected:NO];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}

@end
