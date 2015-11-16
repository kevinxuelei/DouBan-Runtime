//
//  AppDelegate.m
//  WJL-Watercress
//
//  Created by 王剑亮 on 15/9/29.
//  Copyright (c) 2015年 wangjianliang. All rights reserved.
//

#import "AppDelegate.h"
#import "ActivityViewController.h"
#import "MovieViewController.h"
#import "CinemaViewController.h"
#import "UserViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self.window makeKeyAndVisible];
    
    
    ActivityViewController *activityVC = [[ActivityViewController alloc] init];
    
    MovieViewController *movieVC = [[MovieViewController alloc] init];
    
    CinemaViewController *cinemaVC = [[CinemaViewController alloc] init];
    
    UserViewController *userVC = [[UserViewController alloc] init];
    
    UINavigationController *activityNC = [[UINavigationController alloc] initWithRootViewController:activityVC];
    
    UINavigationController *movieNC = [[UINavigationController alloc] initWithRootViewController:movieVC];
    
    UINavigationController *cinemaNC = [[UINavigationController alloc] initWithRootViewController:cinemaVC];
    UINavigationController *userNC = [[UINavigationController alloc] initWithRootViewController:userVC];
    
    UITabBarController *tabbarVC = [[UITabBarController alloc] init];
    
    tabbarVC.viewControllers = @[activityNC,movieNC,cinemaNC,userNC];
    
    activityNC.tabBarItem = [[UITabBarItem alloc]
                             initWithTitle:@"活动" image:[UIImage imageNamed:@"activity.png"] selectedImage:[UIImage imageNamed:@"activity.png"]];
    movieNC.tabBarItem = [[UITabBarItem alloc]
                             initWithTitle:@"电影" image:[UIImage imageNamed:@"movie.png"] selectedImage:[UIImage imageNamed:@"movie.png"]];
    cinemaNC.tabBarItem = [[UITabBarItem alloc]
                             initWithTitle:@"影院" image:[UIImage imageNamed:@"cinema.png"] selectedImage:[UIImage imageNamed:@"cinema.png"]];
    userNC.tabBarItem = [[UITabBarItem alloc]
                             initWithTitle:@"我的" image:[UIImage imageNamed:@"user.png"] selectedImage:[UIImage imageNamed:@"user.png"]];
    
    
    self.window.rootViewController = tabbarVC;
    
    
    

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
