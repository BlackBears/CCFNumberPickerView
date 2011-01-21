/**
 *      @file       CCFNumberPickerViewController.h
 *      @author     Cocoa Factory, LLC and Alan Duncan (www.cocoafactory.com)
 *
 *      @date       2011-20-01
 *      @version    1.0
 *
 *      @note       Copyright (c) 2011 Cocoa Factory, LLC
 *                  CCFNumberPicker may be used freely in accordance with the terms of our
 *                  MIT license which is included with this distribution.  Basicaly, we ask
 *                  only for attribution.
 *      
 */

#import <UIKit/UIKit.h>

@class CCFNumberPickerView;

@interface CCFNumberPickerViewController : UIViewController
{
@private
    IBOutlet CCFNumberPickerView *pickerView;
    IBOutlet UILabel *valueLabel;
}

- (IBAction)displayValue:(id)sender;

@end
