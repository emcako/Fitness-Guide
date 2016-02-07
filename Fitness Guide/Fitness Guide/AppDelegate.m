//
//  AppDelegate.m
//  Fitness Guide
//
//  Created by emcako on 01/02/2016.
//  Copyright © 2016 emcako. All rights reserved.
//

#import "AppDelegate.h"
#import <Parse/Parse.h>
#import <AVFoundation/AVAudioPlayer.h>


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [Parse setApplicationId:@"yyiYli6L5Kpr4DxaNdzBxX8sw4PzS28PMIOuaywU"
                  clientKey:@"3LbP5dTwALBb0xjlMlqXQ52VIUVHLZxNQGXfNvVS"];
    
    [application registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:
                                                   (UIUserNotificationTypeBadge
                                                    |UIUserNotificationTypeSound
                                                    |UIUserNotificationTypeAlert) categories:nil]];
    
    return YES;
}

-(void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    UIApplicationState state = [application applicationState];
    
    if (state == UIApplicationStateActive)
    {
        
        NSLog(@"User Info : %@", [userInfo description]);
        
        NSLog(@"User Info Alert Message : %@", [[userInfo objectForKey:@"aps"] objectForKey:@"alert"]);
        
        NSString *messageString = [NSString stringWithFormat:@"%@", [[userInfo objectForKey:@"aps"] objectForKey:@"alert"]];
        
        NSString *playSoundOnAlert = [NSString stringWithFormat:@"%@", [[userInfo objectForKey:@"aps"] objectForKey:@"sound"]];
        
        NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/%@",[[NSBundle mainBundle] resourcePath],playSoundOnAlert]];
        
        NSError *error;
        
        AVAudioPlayer* audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
        audioPlayer.numberOfLoops = 0;
        [audioPlayer play];
        
    }
    
    
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
