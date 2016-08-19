//
//  GZVideoModel.h
//  News
//
//  Created by Eddie on 16/8/18.
//  Copyright © 2016年 xiebangyuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BmobSDK/Bmob.h"

@interface GZVideoModel : BmobObject

@property(nonatomic, strong) NSNumber *count;
@property(nonatomic, strong) NSString *url;
@property(nonatomic, strong) NSString *imageUrl;
@property(nonatomic, strong) NSString *author;
@property(nonatomic, strong) NSNumber *videoType;
@property(nonatomic, strong) NSNumber *star;
@property(nonatomic, strong) NSString *videoName;
@end
