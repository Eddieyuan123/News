//
//  BannerViewCell.m
//  News
//
//  Created by Eddie on 16/8/18.
//  Copyright © 2016年 xiebangyuan. All rights reserved.
//

#import "BannerViewCell.h"

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

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
