//
//  GZBarrageModel.h
//  News
//
//  Created by Eddie on 16/8/20.
//  Copyright © 2016年 xiebangyuan. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "BmobSDK/Bmob.h"

@interface GZBarrageModel : BmobObject

@property(nonatomic, strong) NSString *url;
@property(nonatomic, strong) NSString *imageUrl;
@property(nonatomic, strong) NSNumber *type;
@property(nonatomic, strong) NSString *text;

@end
