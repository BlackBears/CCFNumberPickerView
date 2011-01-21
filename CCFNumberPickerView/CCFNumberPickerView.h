//
//  CCFMeasureStripView.h
//  CCFNumberPicker
//
//  Created by Alan Duncan on 1/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CCFNumberPickerScrollView;
@class CCFNumberPickerData;

@interface CCFNumberPickerView : UIView <UIScrollViewDelegate>
{
@private
    CCFNumberPickerScrollView *_scrollView;
    UILabel *_indicatorLabel;
    
    NSTimer *_scrollTimer;
    float _currentValue;
    
    CCFNumberPickerData *_data;
}

/**
 *   @property  currentValue
 *   @brief     Read-only current displayed value
 *   @details   Returns the represented value in the number picker view.
 */
@property (nonatomic, readonly) float currentValue;

/**
 *    @method    initWithFrame:measureStripData:
 *    @brief     Designated initializer
 *    @details   Returns instance of the class given a frame and a number picker data block.
 *    @param     frame The frame of the view
 *    @param     data Data block
 *    @result    Instance of the class
 */
- (id)initWithFrame:(CGRect)frame measureStripData:(CCFNumberPickerData *)data;

- (void)setData:(CCFNumberPickerData *)someData;

@end
