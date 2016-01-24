//
//  SCAppDelegate.m
//  SCSignInUp
//
//  Created by Michael Evensen on 4/2/14.
//  Copyright (c) 2014 SoundCloud. All rights reserved.
//

#import "SCAppDelegate.h"

@implementation SCAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Custom Nav bar color
    [[UINavigationBar appearance] setBarTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setTitleVerticalPositionAdjustment:-1.0 forBarMetrics:UIBarMetricsDefault];
    
    // For typography in NavigationBar
    UIFont *interstateLight = [UIFont fontWithName:@"Interstate-Light" size: 17.0];
    
    [[UINavigationBar appearance] setTitleTextAttributes:@{ NSFontAttributeName : interstateLight }];
    [[UIBarButtonItem appearance] setTitleTextAttributes:@{ NSFontAttributeName : interstateLight } forState:UIControlStateNormal];
    [[UIBarButtonItem appearance] setTitleTextAttributes:@{ NSFontAttributeName : interstateLight } forState:UIControlStateDisabled];
    [[UIBarButtonItem appearance] setTitleTextAttributes:@{ NSFontAttributeName : interstateLight } forState:UIControlStateHighlighted];

    // For Text Field Hightlights
    // * Causes a strange bug with tintColor in Storyboards. Where every View Controller after the first ignores it's tint.
//    [[UITextField appearance] setTintColor:[UIColor colorWithRed:1 green:0.333 blue:0 alpha:1]];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
