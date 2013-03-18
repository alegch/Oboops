//
//  OCAppDelegate.m
//  ObooopsClient
//
//  Created by Chebulaev Oleg on 15.03.13.
//  Copyright (c) 2013 Chebulaev Oleg. All rights reserved.
//

#import "OCAppDelegate.h"
#import "OCBoobsListViewController.h"

@implementation OCAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    OCBoobsListViewController *vc = [[OCBoobsListViewController alloc] init];
    
    UITabBarController *tabVc = [[UITabBarController alloc] init];
    tabVc.viewControllers = @[vc];
    self.window.rootViewController = tabVc;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application {

}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {

}

- (void)applicationWillTerminate:(UIApplication *)application {

}

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
}
*/

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
{
}
*/

@end
