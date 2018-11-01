//
//  AppDelegate.m
//  bitrise-test
//
//  Created by Bryce Buchanan on 11/1/18.
//  Copyright © 2018 New Relic. All rights reserved.
//

#import "AppDelegate.h"
#import <NewRelicAgent/NewRelic.h>

@interface NewRelic(Development)
/*
 Starts the agent and has it report to the given collector and crash urls for development purposes.
 */
+ (void)startWithApplicationToken:(NSString*)appToken
              andCollectorAddress:(NSString*)url
         andCrashCollectorAddress:(NSString *)crashCollectorUrl;

// + (BOOL) harvestNow;
// triggers a harvest immidediately. Used for testing.
// returns YES if it's able to execute a harvest request
// returns NO if it's not in the correct harvest state and cannot execute a harvest
+ (BOOL) harvestNow;

@end


@interface AppDelegate ()
@end

#define NEW_RELIC_AGENT_COLLECTOR_ADDRESS @"staging-mobile-collector.newrelic.com"
#define NEW_RELIC_CRASH_COLLECTOR_ADDRESS @"staging-mobile-crash.newrelic.com"


@implementation AppDelegate



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [NewRelicAgent startWithApplicationToken:@""];

    [NewRelic startWithApplicationToken:@"AA35c76060ca815669203ae2efee758fb561c25640"
                    andCollectorAddress:NEW_RELIC_AGENT_COLLECTOR_ADDRESS
               andCrashCollectorAddress:NEW_RELIC_CRASH_COLLECTOR_ADDRESS];

    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
