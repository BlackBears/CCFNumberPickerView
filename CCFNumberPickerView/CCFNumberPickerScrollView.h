/**
 *      @file       CCFNumberPickerScrollView 
 *      @author     Cocoa Factory, LLC and Alan Duncan (www.cocoafactory.com)
 *
 *      @date       2011-11-01
 *      @version    1.0
 *
 *      @note       Copyright (c) 2011 Cocoa Factory, LLC
 *                  CCFNumberPicker may be used freely in accordance with the terms of our
 *                  MIT license which is included with this distribution.  Basicaly, we ask
 *                  only for attribution.
 *      
 */
#import <UIKit/UIKit.h>

@class CCFNumberPickerContentView;
@class CCFNumberPickerData;

/**
 *   @class       CCFNumberPickerScrollView 
 *   @abstract    Interior scroll view
 *   @details     A scroll view that resides within the main CCFNumberPickerView hierarchy
 *   
 */
@interface CCFNumberPickerScrollView : UIScrollView
{
@private

    CCFNumberPickerData *_data;
    CCFNumberPickerContentView *_stripView;
}

/**
 *   @property  stripView
 *   @brief     Retained content view
 *   @details   The content view which draws the scale.
 */
@property (nonatomic, retain) CCFNumberPickerContentView *stripView;

/**
 *    @method    initWithFrame:data:
 *    @brief     Designated initializer
 *    @details   Returns instance of the class given a frame and data block
 *    @param     frame The frame of the view
 *    @param     someData The data block used to construct the view
 *    @result   Instance of the class
 */
- (id)initWithFrame:(CGRect)frame data:(CCFNumberPickerData *)someData;

@end
