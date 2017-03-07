//
//  GFPFilesTableViewCell.m
//  V2_Commbar
//
//  Created by yanzhen on 17/1/24.
//  Copyright © 2017年 com.v2tech. All rights reserved.
//

#import "GFPFilesTableViewCell.h"

@interface GFPFilesTableViewCell ()
@property (retain, nonatomic) IBOutlet UIButton *selectedBtn;
@property (retain, nonatomic) IBOutlet UIImageView *mainImageView;
@property (retain, nonatomic) IBOutlet UILabel *nameLabel;
@property (retain, nonatomic) IBOutlet UILabel *timeLabel;
@property (retain, nonatomic) IBOutlet UILabel *sizeLabel;

@end

@implementation GFPFilesTableViewCell

- (void)configureWithAsset:(PHAsset *)asset isSelected:(BOOL)selected{
    self.selectedBtn.selected = selected;
    
    __block typeof(self) blockSelf = self;
    PHImageRequestOptions *options = [[PHImageRequestOptions alloc] init];
    options.resizeMode = PHImageRequestOptionsResizeModeFast;
    options.deliveryMode = PHImageRequestOptionsDeliveryModeFastFormat;//缩略图
    [[PHImageManager defaultManager] requestImageForAsset:asset targetSize:CGSizeMake(100, 100) contentMode:PHImageContentModeAspectFill options:options resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
        blockSelf.mainImageView.image = result;
    }];
    
    [[PHImageManager defaultManager] requestImageDataForAsset:asset options:nil resultHandler:^(NSData * _Nullable imageData, NSString * _Nullable dataUTI, UIImageOrientation orientation, NSDictionary * _Nullable info) {
        NSString *pathAllStr = info[@"PHImageFileSandboxExtensionTokenKey"];
        blockSelf.sizeLabel.text = [blockSelf fileSizeString:imageData.length * 1.0];
        blockSelf.nameLabel.text = pathAllStr.lastPathComponent;
    }];
    self.timeLabel.text = asset.creationDate.description;
}

- (NSString *)fileSizeString:(CGFloat)value
{
    if (value < 1024) {
        return [NSString stringWithFormat:@"%0.00f B",value];
    }
    else if (value < 1048576){
        return [NSString stringWithFormat:@"%0.2f KB",value / 1024.0];
    }
    else{
        return [NSString stringWithFormat:@"%0.2f MB",value / 1048576.0];
    }
    return @"unKnown";
}

-(void)setIsPicked:(BOOL)isPicked{
    _isPicked = isPicked;
    self.selectedBtn.selected = isPicked;
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
