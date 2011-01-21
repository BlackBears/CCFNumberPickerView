//
//  CCFNumberPickerViewController.m
//  CCFNumberPicker
//
//  Created by Alan Duncan on 1/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CCFNumberPickerViewController.h"
#import "CCFNumberPickerData.h"
#import "CCFNumberPickerView.h"

@implementation CCFNumberPickerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CCFNumberPickerData *data = [[CCFNumberPickerData alloc] init];
    [data setMin:50];
    [data setMax:410];
    [data setMinorTickCount:5];
    [data setMinorTickSpacing:10];
    [data setMajorTickUnit:10];
    [data setMajorTickNumFormat:@"%0.0f"];
    [data setIndicatorNumFormat:@"%0.2f"];
    [data setStyle:CCFNumberPickerStyleLight];
    [pickerView setData:[data autorelease]];

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)displayValue:(id)sender;
{
    float currentValue = [pickerView currentValue];
    NSString *valString = [NSString stringWithFormat:@"%0.1f",currentValue];
    [valueLabel setText:valString];
}

@end
