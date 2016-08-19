//
//  main.m
//  News
//
//  Created by chelizi on 16/8/18.
//  Copyright © 2016年 xiebangyuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "BmobSDK/Bmob.h"


int main(int argc, char * argv[]) {
    @autoreleasepool {
        [Bmob registerWithAppKey:@"0067b643284021673ca760fe575e3873"];
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
