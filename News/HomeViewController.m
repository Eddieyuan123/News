//
//  HomeViewController.m
//  News
//
//  Created by chelizi on 16/8/19.
//  Copyright © 2016年 xiebangyuan. All rights reserved.
//

#import "HomeViewController.h"
#import <MBProgressHUD/MBProgressHUD.h>
#import "BannerViewCell.h"
#import "public.h"
#import "BmobSDK/Bmob.h"
#import "GZVideoModel.h"
#import "ImageScrollCell.h"



@interface HomeViewController ()<UITableViewDataSource,UITableViewDelegate
                                    ,ImageScrollViewDelegate>{
    
    NSMutableArray *_videoMutableArray;
    NSMutableArray *_focusImgurlArray;
    MBProgressHUD *hud;
}




@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.navigationController setNavigationBarHidden:YES];
    self.view.backgroundColor = [UIColor whiteColor];
    hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeAnnularDeterminate;
    hud.labelText = @"拼命加载中";
    _videoMutableArray = [[NSMutableArray alloc] initWithCapacity:1];
    _focusImgurlArray = [[NSMutableArray alloc] initWithCapacity:1];
    [_focusImgurlArray removeAllObjects];
    NSString *photoURL0 = @"http://img1.imgtn.bdimg.com/it/u=1302463328,4122839787&fm=21&gp=0.jpg";
    NSString *photoURL1 = @"http://img1.imgtn.bdimg.com/it/u=1755675502,2574324799&fm=21&gp=0.jpg";
    NSString *photoURL2 = @"http://img0.imgtn.bdimg.com/it/u=3901532170,254545208&fm=21&gp=0.jpg";
    NSString *photoURL3 = @"http://img1.imgtn.bdimg.com/it/u=1119164522,1002682415&fm=21&gp=0.jpg";
    [_focusImgurlArray addObject:photoURL0];
    [_focusImgurlArray addObject:photoURL1];
    [_focusImgurlArray addObject:photoURL2];
    [_focusImgurlArray addObject:photoURL3];
    [self initData];
    [self.tableView setContentInset:UIEdgeInsetsMake(0, 0, 50, 0)];
}


-(void)initData{
    
    [_videoMutableArray removeAllObjects];

    BmobQuery *bquery = [BmobQuery queryWithClassName:@"Video"];
    [bquery orderByDescending:@"updatedAt"];
    //[bquery whereKey:@"videoType" equalTo:[NSNumber numberWithInt:1]];
    [bquery findObjectsInBackgroundWithBlock:^(NSArray *array,NSError *error){
        
        if (error) {
            
        }else{
            [hud hide:YES];
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
                
                [_videoMutableArray addObject:videoModel];
            }
            [self.tableView reloadData];
        }
    
    }];

}
/*
 table view total number
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_videoMutableArray count] + 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 155;
    }else{
        return 100;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];// 取消选中
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        static NSString *cellIndentifier = @"imageScroll";
        ImageScrollCell *imageScrollCell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
        if (imageScrollCell == nil) {
            imageScrollCell = [[ImageScrollCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier frame:CGRectMake(0, 0, screen_width, 155)];
        }
        imageScrollCell.imageScrollView.delegate = self;
        [imageScrollCell setImageArr:_focusImgurlArray];
        return imageScrollCell;
    }else{
        static NSString* indentifier = @"customBanner";
        BannerViewCell* bannerViewCell = [tableView dequeueReusableCellWithIdentifier:indentifier];
        if(bannerViewCell == nil) {
            [tableView registerNib:[UINib nibWithNibName:@"BannerViewCell" bundle:nil]  forCellReuseIdentifier:indentifier];
            bannerViewCell = [tableView dequeueReusableCellWithIdentifier:indentifier];
        }
        GZVideoModel *videoModel = (GZVideoModel*)[_videoMutableArray objectAtIndex:indexPath.row];
        [bannerViewCell setGZVideoModel:videoModel];
        return bannerViewCell;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
