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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* indentifier = @"customBanner";
    BannerViewCell* cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
//    if(cell == nil) {
//        cell = [[BannerViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
//        }
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
