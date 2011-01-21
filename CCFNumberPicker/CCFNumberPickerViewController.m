
/**
 *  CCFNumberPickerViewController.m
 *  Copyright (c) 2011 Cocoa Factory, LLC
 */

#import "CCFNumberPickerViewController.h"
#import "CCFNumberPickerData.h"
#import "CCFNumberPickerView.h"

@implementation CCFNumberPickerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

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
    [data setStyle:CCFNumberPickerStyleDark];
    [data setShowsValueInScale:NO];
    [pickerView setData:[data autorelease]];

}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)displayValue:(id)sender;
{
    float currentValue = [pickerView currentValue];
    NSString *valString = [NSString stringWithFormat:@"%0.1f",currentValue];
    [valueLabel setText:valString];
}

@end
