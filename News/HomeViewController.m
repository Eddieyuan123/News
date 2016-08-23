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



@interface HomeViewController ()<UITableViewDataSource,UITableViewDelegate>{
    
    NSMutableArray *_videoMutableArray;
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
    return [_videoMutableArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
