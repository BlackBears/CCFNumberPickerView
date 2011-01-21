//
//  CCFMeasureScrollView.h
//  CCFNumberPicker
//
//  Created by Alan Duncan on 1/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

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
