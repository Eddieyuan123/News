//
//  HomeViewController.m
//  News
//
//  Created by chelizi on 16/8/19.
//  Copyright © 2016年 xiebangyuan. All rights reserved.
//

#import "HomeViewController.h"
#import "BannerViewCell.h"
#import "public.h"

@interface HomeViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.navigationController setNavigationBarHidden:YES];
    self.view.backgroundColor = [UIColor whiteColor];
}

/*
 table view total number
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 50;
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
    bannerViewCell.courseTitle.text = @"新疆葡萄干";
    return bannerViewCell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
