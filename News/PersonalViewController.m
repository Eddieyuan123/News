//
//  PersonalViewController.m
//  News
//
//  Created by chelizi on 16/8/24.
//  Copyright © 2016年 xiebangyuan. All rights reserved.
//

#import "PersonalViewController.h"
#import "LoginViewCell.h"
#import "UserInfoViewCell.h"

@interface PersonalViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation PersonalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
    self.view.backgroundColor = [UIColor darkGrayColor];
    [self.tableView setContentInset:UIEdgeInsetsMake(0, 0, 50, 0)];
    //去掉分割线
    self.tableView.separatorStyle = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return indexPath.row == 0 ? 250 : 400;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        static NSString *indentifier = @"login";
        LoginViewCell *loginViewCell = [tableView dequeueReusableCellWithIdentifier:indentifier];
        if(loginViewCell == nil) {
            [tableView registerNib:[UINib nibWithNibName:@"LoginViewCell" bundle:nil]  forCellReuseIdentifier:indentifier];
            loginViewCell = [tableView dequeueReusableCellWithIdentifier:indentifier];
        }
        return loginViewCell;
    }else{
        static NSString *indentifier = @"userInfo";
        UserInfoViewCell *userInfoViewCell = [tableView dequeueReusableCellWithIdentifier:indentifier];
        if(userInfoViewCell == nil) {
            [tableView registerNib:[UINib nibWithNibName:@"UserInfoViewCell" bundle:nil]  forCellReuseIdentifier:indentifier];
            userInfoViewCell = [tableView dequeueReusableCellWithIdentifier:indentifier];
        }
        return userInfoViewCell;
    }
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
