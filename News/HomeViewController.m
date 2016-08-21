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
#import "constant.h"
#import "BmobSDK/Bmob.h"
#import "GZVideoModel.h"
#import "ImageScrollCell.h"
#import "QuickEntryViewCell.h"
#import "BmobRequest.h"
#import "MJRefresh.h"
#import "MJExtension.h"



@interface HomeViewController ()<UITableViewDataSource,UITableViewDelegate
,ImageScrollViewDelegate,BmobRequestDelegate>{
    
    NSMutableArray *_videoMutableArray;
    NSMutableArray *_focusImgurlArray;
    MBProgressHUD *hud;
    BmobRequest* bmobRequest;
    int currentPage;
    int pageSize;
}

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    currentPage = 0;
    pageSize = 5;
    [self.navigationController setNavigationBarHidden:YES];
    self.view.backgroundColor = [UIColor darkGrayColor];
    hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeAnnularDeterminate;
    hud.labelText = @"拼命加载中";
    _videoMutableArray = [[NSMutableArray alloc] initWithCapacity:1];
    _focusImgurlArray = [[NSMutableArray alloc] initWithCapacity:1];
    [self initBannerData];
    [self initVideoData];
    [self.tableView setContentInset:UIEdgeInsetsMake(0, 0, 50, 0)];
    //去掉分割线
    self.tableView.separatorStyle = NO;
    [self setupTableview];
}

//初始化轮播图数据
-(void)initBannerData{
    [_focusImgurlArray removeAllObjects];
    [_focusImgurlArray addObject:PHOTO_URL_0];
    [_focusImgurlArray addObject:PHOTO_URL_1];
    [_focusImgurlArray addObject:PHOTO_URL_3];
    [_focusImgurlArray addObject:PHOTO_URL_2];
}

//初始化视频数据
-(void)initVideoData{
    [_videoMutableArray removeAllObjects];
    bmobRequest = [[BmobRequest alloc] init];
    bmobRequest.delegate = self;
    [bmobRequest requestVideoData:currentPage pageSize:pageSize];
}


-(void)setupTableview{

    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    self.tableView.mj_header.automaticallyChangeAlpha = YES;
    
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    self.tableView.mj_footer.automaticallyChangeAlpha = YES;
}

-(void)loadNewData{
    currentPage = 0;
    [_videoMutableArray removeAllObjects];
    [bmobRequest requestVideoData:currentPage pageSize:pageSize];
}

-(void)loadMoreData{
    [bmobRequest requestVideoData:currentPage pageSize:pageSize];
}
//请求之前 mark BannerViewCellDelegate
-(void)beforeRequest{
    [hud show:YES];
}

//请求成功回调 mark BannerViewCellDelegate
-(void)requestSuccess:(NSMutableArray *) array{
    __weak typeof(self) weakself = self;
    [hud hide:YES];
    if (currentPage == 0) {
        [weakself.tableView.mj_header endRefreshing];
    }else{
        [weakself.tableView.mj_footer endRefreshing];
    }
    [_videoMutableArray addObjectsFromArray:array];
    [weakself.tableView reloadData];
    currentPage++;
}

//请求失败回调 mark BannerViewCellDelegate
-(void)requestError:(NSError *)error{
    if (currentPage == 0) {
        [self.tableView.mj_header endRefreshing];
    }else{
        [self.tableView.mj_footer endRefreshing];
    }
}

/*
 table view total number
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _videoMutableArray.count + 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 155;
    }else if(indexPath.row == 1){
        return 200;
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
    }else if(indexPath.row == 1){
        static NSString* indentifier = @"quickEntry";
        QuickEntryViewCell* quickEntryCell = [tableView dequeueReusableCellWithIdentifier:indentifier];
        if(quickEntryCell == nil) {
            [tableView registerNib:[UINib nibWithNibName:@"QuickEntryViewCell" bundle:nil]  forCellReuseIdentifier:indentifier];
            quickEntryCell = [tableView dequeueReusableCellWithIdentifier:indentifier];
        }
        return quickEntryCell;
    }else{
        static NSString* indentifier = @"customBanner";
        BannerViewCell* bannerViewCell = [tableView dequeueReusableCellWithIdentifier:indentifier];
        if(bannerViewCell == nil) {
            [tableView registerNib:[UINib nibWithNibName:@"BannerViewCell" bundle:nil]  forCellReuseIdentifier:indentifier];
            bannerViewCell = [tableView dequeueReusableCellWithIdentifier:indentifier];
        }
        GZVideoModel *videoModel = (GZVideoModel*)[_videoMutableArray objectAtIndex:indexPath.row - 2];
        [bannerViewCell setGZVideoModel:videoModel];
        return bannerViewCell;
    }
}


#pragma mark - ImageScrollViewDelegate
-(void)didSelectImageAtIndex:(NSInteger)index{

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
