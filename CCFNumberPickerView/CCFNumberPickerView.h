/**
 *      @file       CCFNumberPickerView.h
 *      @author     Cocoa Factory, LLC and Alan Duncan (www.cocoafactory.com)
 *
 *      @date       2011-12-01
 *      @version    1.0
 *
 *      @note       Copyright (c) 2011 Cocoa Factory, LLC
 *                  CCFNumberPicker may be used freely in accordance with the terms of our
 *                  MIT license which is included with this distribution.  Basicaly, we ask
 *                  only for attribution.
 *      
 */
#import <UIKit/UIKit.h>

@class CCFNumberPickerScrollView;
@class CCFNumberPickerData;

/**
 *   @class       CCFNumberPickerView 
 *   @abstract    Top-level view object
 *   @details     This is the top-level view object in CCFNumberPicker, and one of two classes with 
 *                which developers will need to work directly.  It is the superview for a hierarchy 
 *                of views which comprise the on-screen representation of the number picker.  It may
 *                be instantiated either programmatically or via a nib.
 *      
 *   
 *   @notes       Conforms to the UIScrollViewDelegate protocol because one of its subviews is a
 *                UIScrollView subclass.
 */
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
