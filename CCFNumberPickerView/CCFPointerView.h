/**
 *      @file       CCFMeasureBezelView.h
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

@class CCFNumberPickerData;

/**
 * @class       CCFPointerView
 * @brief       Draws a pointer in the bezel
 * @details     Simply draws a vertical pointer in the view to indicate the current value
 *
 * @notes       Private element of the view hierarchy
 *
 *
 *
 */
@interface CCFPointerView : UIView
{
@private
    CCFNumberPickerData *_data;
}

/**
 *    @method    initWithFrame:data:
 *    @brief     Designated initializer
 *    @details   Returns instance of the class given size and a number picker data object.
 *    @param     frame The frame for the pointer view.
 *    @param     someData Number picker data object
 *    @result    Instance of the class
 */
- (id)initWithFrame:(CGRect)frame data:(CCFNumberPickerData *)someData;

@end
