//
//  CCFNumberPickerViewController.h
//  CCFNumberPicker
//
//  Created by Alan Duncan on 1/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

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
