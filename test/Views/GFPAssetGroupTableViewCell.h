//
//  GFPAssetGroupTableViewCell.h
//  V2_Commbar
//
//  Created by yanzhen on 17/1/24.
//  Copyright © 2017年 com.v2tech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Photos/Photos.h>

@interface GFPAssetGroupTableViewCell : UITableViewCell
//- (void)configure:(ALAssetsGroup *)group firstAsset:(ALAsset *)asset;
- (void)configure:(PHAssetCollection *)collection;
@end
