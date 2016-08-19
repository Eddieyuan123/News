//
//  AppDelegate.h
//  News
//
//  Created by chelizi on 16/8/18.
//  Copyright © 2016年 xiebangyuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property(nonatomic,strong) UITabBarController* tabBarController;

@property(nonatomic, assign) BOOL isFullScreen;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end

