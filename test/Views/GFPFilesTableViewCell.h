//
//  GFPFilesTableViewCell.h
//  V2_Commbar
//
//  Created by yanzhen on 17/1/24.
//  Copyright © 2017年 com.v2tech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Photos/Photos.h>

@interface GFPFilesTableViewCell : UITableViewCell
@property (nonatomic, assign) BOOL isPicked;
@property (nonatomic, assign) BOOL isDirectory;

- (void)configureWithAsset:(PHAsset *)asset isSelected:(BOOL)selected;
//- (void)configureWithFileName:(NSString *)name filePath:(NSString *)filePath isSelected:(BOOL)selected;
@end
