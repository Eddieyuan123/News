//
//  BannerViewCell.m
//  News
//
//  Created by Eddie on 16/8/18.
//  Copyright © 2016年 xiebangyuan. All rights reserved.
//

#import "BannerViewCell.h"
#import "UIImageView+WebCache.h"
#import "public.h"

@implementation BannerViewCell

- (void)awakeFromNib {
    // Initialization code
    [super awakeFromNib];
    //设置button圆角
    self.courseCollectBtn.backgroundColor = navigationBarColor;
    [self.courseCollectBtn.layer setMasksToBounds:YES];
    [self.courseCollectBtn.layer setCornerRadius:13.0];
    //去掉点击背景色
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

-(void)setGZVideoModel:(GZVideoModel *)videoModel{
    self.courseTitle.text = videoModel.videoName;
    self.courseAuthor.text = videoModel.author;
    [self.courseImg sd_setImageWithURL:[NSURL URLWithString:videoModel.imageUrl] placeholderImage:[UIImage imageNamed:@"search_btn_unpre_bg"]];
     if (videoModel.star) {
        for (int i = 0; i < videoModel.star.intValue; i++) {
            UIImageView *imageView = [[UIImageView alloc] init];
            imageView.frame = CGRectMake(i*20, 0, 20 , 20);
            [imageView setImage:[UIImage
                                 imageNamed:@"ic_global_operate_bar_bottom_collect_collected"]];
            [self.starView addSubview:imageView];
        }
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
