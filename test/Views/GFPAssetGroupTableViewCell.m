//
//  GFPAssetGroupTableViewCell.m
//  V2_Commbar
//
//  Created by yanzhen on 17/1/24.
//  Copyright © 2017年 com.v2tech. All rights reserved.
//

#import "GFPAssetGroupTableViewCell.h"

@interface GFPAssetGroupTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *mainImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *countLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end

@implementation GFPAssetGroupTableViewCell

- (void)configure:(PHAssetCollection *)collection{
    PHFetchOptions *options = [[PHFetchOptions alloc] init];
    options.sortDescriptors = @[[[NSSortDescriptor alloc] initWithKey:@"creationDate" ascending:YES]];
    PHFetchResult<PHAsset *> *assets = [PHAsset fetchAssetsInAssetCollection:collection options:options];
    PHAsset *asset = assets.lastObject;
    self.nameLabel.text = collection.localizedTitle;
    self.countLabel.text = [NSString stringWithFormat:@"(%ld)",assets.count];
    self.timeLabel.text = [asset.creationDate description];
    //
    [[PHImageManager defaultManager] requestImageForAsset:asset targetSize:CGSizeMake(100, 100) contentMode:PHImageContentModeAspectFill options:nil resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
        self.mainImageView.image = result;
    }];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
