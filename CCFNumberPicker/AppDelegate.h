//
//  AppDelegate.h
//  CCFNumberPicker
//
//  Created by Alan Duncan on 1/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CCFNumberPickerViewController;

@interface AppDelegate : NSObject <UIApplicationDelegate> {
@private

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet CCFNumberPickerViewController *viewController;

@end
