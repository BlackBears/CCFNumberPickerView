
/**
 *  AppDelegate.m
 *  Copyright (c) 2011 Cocoa Factory, LLC
 */

#import "AppDelegate.h"
#import "CCFNumberPickerViewController.h"

@implementation AppDelegate

@synthesize window;
@synthesize viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{     
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
}

- (void)applicationWillTerminate:(UIApplication *)application
{

}

- (void)dealloc {

    [window release];
    [viewController release];
    [super dealloc];
}

@end
