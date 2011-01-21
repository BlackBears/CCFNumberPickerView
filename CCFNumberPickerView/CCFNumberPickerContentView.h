/**
 *      @file       CCFNumberPickerContentView.h
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

@class CCFNumberPickerData;

/**
 *   @class       CCFNumberPickerContentView 
 *   @abstract    Content view
 *   @details     Draws the numerical scale or the number picker view
 *   
 */
@interface CCFNumberPickerContentView : UIView
{
@private
    CCFNumberPickerData *_data;
    
    CGFloat _positionAdjustment;
    CGFloat _bottom;
    
    float _cachedScale;
}

/**
 *    @method    initWithFrame:data:
 *    @brief     Designated initializer
 *    @details   Returns an instance of the class given a frame and data blck
 *    @param     frame The frame of the view
 *    @param     someData Data block used to construct the view
 *    @result    Instance of the class
 */
- (id)initWithFrame:(CGRect)frame data:(CCFNumberPickerData *)someData;

@end
