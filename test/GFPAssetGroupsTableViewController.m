//
//  GFPAssetGroupsTableViewController.m
//  test
//
//  Created by yanzhen on 17/3/6.
//  Copyright © 2017年 v2tech. All rights reserved.
//

#import "GFPAssetGroupsTableViewController.h"
#import "GFPAssetGroupTableViewCell.h"
#import "GFPAssetsTableViewController.h"
#import <Photos/Photos.h>



@interface GFPAssetGroupsTableViewController ()
@property (nonatomic, strong) NSMutableArray *groups;
@property (nonatomic, strong) NSMutableArray *assetsArrays;
@end

@implementation GFPAssetGroupsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _groups = [[NSMutableArray alloc] init];
    _assetsArrays = [[NSMutableArray alloc] init];
    self.tableView.rowHeight = 65;
    [self setData];
    
}



- (void)setData{
    [_groups removeAllObjects];
    
    __block typeof(self) blockSelf = self;
    //相机胶卷
    PHFetchResult<PHAssetCollection *> *cameraRoll = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeSmartAlbum subtype:PHAssetCollectionSubtypeSmartAlbumUserLibrary options:nil];
    [cameraRoll enumerateObjectsUsingBlock:^(PHAssetCollection * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [blockSelf.groups addObject:obj];
    }];
    
    PHFetchResult<PHAssetCollection *> *result1 = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeAlbum subtype:PHAssetCollectionSubtypeAlbumSyncedAlbum options:nil];
    [result1 enumerateObjectsUsingBlock:^(PHAssetCollection * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [blockSelf.groups addObject:obj];
    }];
    
    //自定义
    PHFetchResult<PHAssetCollection *> *result = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeAlbum subtype:PHAssetCollectionSubtypeAlbumRegular options:nil];
    [result enumerateObjectsUsingBlock:^(PHAssetCollection * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [blockSelf.groups addObject:obj];
    }];
    
}

#pragma mark - 获取全部图片资源
- (void)getAllAssets{
    PHFetchOptions *options = [[PHFetchOptions alloc] init];
    options.sortDescriptors = @[[[NSSortDescriptor alloc] initWithKey:@"creationDate" ascending:YES]];
    PHFetchResult<PHAsset *> *assets = [PHAsset fetchAssetsWithMediaType:PHAssetMediaTypeImage options:options];
    [assets enumerateObjectsUsingBlock:^(PHAsset * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"TTTT:%@",obj.creationDate);
    }];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.groups.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GFPAssetGroupTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GFPAssetGroupTableViewCell"];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"GFPAssetGroupTableViewCell" owner:nil options:nil].lastObject;
    }
    cell.backgroundColor = indexPath.row % 2 ? YZColor(232, 240, 249) : [UIColor whiteColor];
    PHAssetCollection *collection = self.groups[indexPath.row];
    [cell configure:collection];
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    GFPAssetsTableViewController *vc = [[GFPAssetsTableViewController alloc] initWithAssetCollection:self.groups[indexPath.row]];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
