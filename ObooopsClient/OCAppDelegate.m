//
//  OCAppDelegate.m
//  ObooopsClient
//
//  Created by Chebulaev Oleg on 15.03.13.
//  Copyright (c) 2013 Chebulaev Oleg. All rights reserved.
//

#import "OCAppDelegate.h"
#import "OCBoobsListViewController.h"
#import "OCCDBoobs.h"

@implementation OCAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    [MagicalRecord setupCoreDataStackWithStoreNamed:@"Storage.sqlite"];
    
//    NSManagedObjectContext *context = [NSManagedObjectContext contextForCurrentThread];
//    
//    OCCDBoobs *b = [NSEntityDescription insertNewObjectForEntityForName:@"OCCDBoobs" inManagedObjectContext:context];
//    b.identifier = [NSNumber numberWithInt:10];
//    [context saveToPersistentStoreAndWait];
//    
//    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"OCCDBoobs"];
//    
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"identifier == %d", 10];
//    [request setPredicate:predicate];
//    
//    NSSortDescriptor *sortD = [[NSSortDescriptor alloc] initWithKey:@"identifier" ascending:YES];
//    [request setSortDescriptors:@[sortD]];
//    
//    NSError *error = nil;
//    NSArray *objects = [context executeFetchRequest:request error:&error];
//    if (error) {
//        NSLog(@"Ero:%@", [error localizedDescription]);
//    }
//    
//    OCCDBoobs *b1 = [objects objectAtIndex:0];
//    NSLog(@"%d", [b1.identifier integerValue]);
//    
//    
//    ///
//    NSArray *bobbs = [OCCDBoobs MR_findAll];
//    OCCDBoobs *b23 = [OCCDBoobs findFirstByAttribute:@"idenfier" withValue:[NSNumber numberWithInt:10]];
//    
//    NSArray *sortedBoobs = [OCCDBoobs findAllSortedBy:@"idenfier" ascending:YES];
//    
//    //
//    OCCDBoobs *b3 = [OCCDBoobs createEntity];
//    ///
//    // set properties
//    //
//    [[NSManagedObjectContext contextForCurrentThread] saveToPersistentStoreAndWait];
    
    
    OCBoobsListViewController *vc = [[OCBoobsListViewController alloc] init];
    
    UINavigationController *navVc = [[UINavigationController alloc] initWithRootViewController:vc];
    self.window.rootViewController = navVc;
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
