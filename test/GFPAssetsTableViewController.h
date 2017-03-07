//
//  GFPAssetsTableViewController.h
//  test
//
//  Created by yanzhen on 17/3/7.
//  Copyright © 2017年 v2tech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Photos/Photos.h>

#define YZColor(R,G,B) [UIColor colorWithRed:(R)/255.0 green:(G)/255.0 blue:(B)/255.0 alpha:1]

@interface GFPAssetsTableViewController : UITableViewController
- (instancetype)initWithAssetCollection:(PHAssetCollection *)assetCollection;
@end
