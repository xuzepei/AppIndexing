//
//  AppDelegate.m
//  AppIndexingDemo
//
//  Created by xuzepei on 15/12/24.
//  Copyright © 2015年 xuzepei. All rights reserved.
//

#import "AppDelegate.h"
#import <GoogleAppIndexing/GoogleAppIndexing.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [[GSDAppIndexing sharedInstance] registerApp:1058119446];
    
    //iOS Searchable Activity
    NSUserActivity* activity = [[NSUserActivity alloc] initWithActivityType:@"com.test.appIndexing.myActivityType"];
    activity.title = @"myActivityTitle";
    activity.userInfo = @{@"url": @"http://www.mydomain.com/myContentItem/ABC-123"};
    activity.eligibleForSearch = true;
    activity.eligibleForPublicIndexing = true;
    activity.eligibleForHandoff = true;
    activity.keywords = [[NSSet alloc] initWithArray:@[@"demo",@"indexing",@"hello"]];
    activity.delegate = self;
    activity.needsSave = YES;
    [activity becomeCurrent];
    
    return YES;
}

- (void)userActivityWillSave:(NSUserActivity *)userActivity
{
    NSLog(@"userActivityWillSave");
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

- (BOOL)application:(UIApplication *)application
continueUserActivity:(NSUserActivity *)userActivity
 restorationHandler:(void (^)(NSArray *restorableObjects))restorationHandler
{
    
    NSString* message = [NSString stringWithFormat:@"Opened by universal link:%@",userActivity.webpageURL.absoluteString];
    
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Tip" message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
    
    return YES;
}

@end
