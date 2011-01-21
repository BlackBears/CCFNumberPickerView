//
//  CCFMeasureBezelView.h
//  CCFNumberPicker
//
//  Created by Alan Duncan on 1/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

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
