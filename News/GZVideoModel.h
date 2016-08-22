//
//  GZVideoModel.h
//  News
//
//  Created by Eddie on 16/8/18.
//  Copyright © 2016年 xiebangyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GZVideoModel : NSObject

@property(nonatomic, strong) NSString *imageUrl;
@property(nonatomic, strong) NSString *courseTitle;
@property(nonatomic, strong) NSString *courseDesc;
@property(nonatomic, strong) NSString *courseAuthor;
@property(nonatomic, strong) NSString *courseUrl;

-(void)setImageUrl:(NSString *)imageUrl;
-(NSString*) imageUrl;
@end
