//
//  BannerViewCell.m
//  News
//
//  Created by Eddie on 16/8/18.
//  Copyright © 2016年 xiebangyuan. All rights reserved.
//

#import "BannerViewCell.h"
#import "UIImageView+WebCache.h"

@implementation BannerViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initViews];
    }
    return self;
}

-(void)initViews{
    self.courseTitle.text = @"新疆葡萄干";
}


-(void)setGZVideoModel:(GZVideoModel *)videoModel{
    self.courseTitle.text = videoModel.videoName;
    self.courseAuthor.text = videoModel.author;
    [self.courseImg sd_setImageWithURL:[NSURL URLWithString:videoModel.imageUrl] placeholderImage:[UIImage imageNamed:@"search_btn_unpre_bg"]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
