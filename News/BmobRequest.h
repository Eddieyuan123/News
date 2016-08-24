//
//  BmobManager.h
//  News
//
//  Created by chelizi on 16/8/24.
//  Copyright © 2016年 xiebangyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BannerViewCellDelegate <NSObject>

@required
-(void)beforeRequest;
-(void)requestSuccess:(NSMutableArray *) array;
-(void)requestError:(NSError *)error;

@end


@interface BmobRequest : NSObject

@property (assign,nonatomic) id<BannerViewCellDelegate> delegate;
@property NSMutableArray *_videoMutableArray;


-(void)requestVideoData:(int)currentPage pageSize:(int)pageSize;
@end
