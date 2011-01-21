//
//  CCFNumberPickerContentView.h
//  CCFNumberPicker
//
//  Created by Alan Duncan on 1/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

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
