//
//  BmobManager.m
//  News
//
//  Created by chelizi on 16/8/24.
//  Copyright © 2016年 xiebangyuan. All rights reserved.
//

#import "BmobRequest.h"
#import "BmobSDK/Bmob.h"
#import "GZVideoModel.h"

@implementation BmobRequest

- (instancetype)init{
    self = [super init];
    if (self) {
        self._videoMutableArray = [[NSMutableArray alloc] initWithCapacity:1];
    }
    return self;
}


//请求数据
-(void)requestVideoData:(int)currentPage pageSize:(int)pageSize{
    if (self.delegate) {
        [self.delegate beforeRequest];
    }
    [__videoMutableArray removeAllObjects];
    BmobQuery *bquery = [BmobQuery queryWithClassName:@"Video"];
    [bquery orderByDescending:@"updatedAt"];
    bquery.limit = pageSize;
    bquery.skip = currentPage * pageSize;
    [bquery findObjectsInBackgroundWithBlock:^(NSArray *array,NSError *error){
        
        if (error) {
            [self.delegate requestError:error];
        }else{
            for (BmobObject *obj in array) {
                GZVideoModel *videoModel = [[GZVideoModel alloc] init];
                if ([obj objectForKey:@"videoName"]) {
                    videoModel.videoName = [obj objectForKey:@"videoName"];
                }
                if ([obj objectForKey:@"imageUrl"]) {
                    videoModel.imageUrl = [obj objectForKey:@"imageUrl"];
                }
                if ([obj objectForKey:@"author"]) {
                    videoModel.author = [obj objectForKey:@"author"];
                }
                if ([obj objectForKey:@"star"]) {
                    videoModel.star = [obj objectForKey:@"star"];
                }
                [self._videoMutableArray addObject:videoModel];
            }
            if (self._videoMutableArray.count > 0) {
                [self.delegate requestSuccess:self._videoMutableArray];
            }
        }
        
    }];
    
}
@end
