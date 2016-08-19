//
//  BannerViewCell.h
//  News
//
//  Created by Eddie on 16/8/18.
//  Copyright © 2016年 xiebangyuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GZVideoModel.h"

@interface BannerViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *courseImg;
@property (strong, nonatomic) IBOutlet UILabel *courseTitle;
@property (strong, nonatomic) IBOutlet UILabel *courseDesc;
@property (strong, nonatomic) IBOutlet UILabel *courseAuthor;
@property (strong, nonatomic) IBOutlet UIButton *courseCollectBtn;
@property (strong, nonatomic) IBOutlet UIView *view;

-(void)setGZVideoModel:(GZVideoModel *)videoModel;
@end
