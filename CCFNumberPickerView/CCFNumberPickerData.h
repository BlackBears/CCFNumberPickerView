//
//  CCFNumberPickerData.h
//  CCFNumberPicker
//
//  Created by Alan Duncan on 1/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum CCFNumberPickerStyles {
    CCFNumberPickerStyleLight,
    CCFNumberPickerStyleDark
} CCFNumberPickerStyle;

/**
 *      @class      CCFNumberPickerData
 *      @brief      Object describing features of measure strip
 *      @details    CCFNumberPickerData objects encapsulate data about the number picker which is 
 *                  shared among objects in the view hierarchy.  Within the hierarchy, view objects
 *                  may use what data they need and/or add new elements that are derived or computed
 *                  at that level.  
 *
 *      @note       This is not a singleton object.  Class users are expected to retain and release
 *                  CCFNumberPickerData instances as with any other obect.
 */
@interface CCFNumberPickerData : NSObject {
@private
    CGFloat _min;
    CGFloat _max;
    CGFloat _minorTickSpacing;
    CGFloat _minorTickCount;
    CGFloat _majorTickUnit;
    CGFloat _scrollViewSize;
    CGFloat _majorUnitLength;
    NSString *_majorTickNumFormat;
    NSString *_indicatorNumFormat;
    
    CGFloat _minorTickLen;
    CGFloat _majorTickLen;
    BOOL _snapsToMinorTick;
    BOOL _showsValueInScale;
    CCFNumberPickerStyle _style;
    
    CGFloat _offsetScaling;     //scaling factor cached for efficiency
}

/**
 *   @property  min
 *   @brief     Minimum value
 *   @details   The minimum value displayed in the number picker view
 */
@property (nonatomic) CGFloat min;

/**
 *   @property  max
 *   @brief     Maximum value
 *   @details   The maximum value isplayed in the number picker view
 */
@property (nonatomic) CGFloat max; 

/**
 *   @property  minorTickSpacing
 *   @brief     Spacing for minor ticks
 *   @details   The number of pixels between minor ticks in the number picker view
 */
@property (nonatomic) CGFloat minorTickSpacing;

/**
 *   @property  minorTickCount
 *   @brief     Minor ticks per major ticks
 *   @details   The number of minor ticks for each major tick.
 */
@property (nonatomic) CGFloat minorTickCount;

/**
 *   @property  majorTickUnit
 *   @brief     Represented unit for the major tick
 *   @details   The numerical unit represented by the major tick.  Determines the numerical increment 
 *              at each major tick.
 */
@property (nonatomic) CGFloat majorTickUnit;

/**
 *   @property  scrollViewSize
 *   @brief     Size of the scroll view component
 *   @details   The size of the scrolling component of the view.
 */
@property (nonatomic) CGFloat scrollViewSize;

/**
 *   @property  majorUnitLength
 *   @brief     Distance between major ticks
 *   @details   The horizontal distance between major ticks.  This is a derived measure, cached for efficiency.
 *
 *   @note      This property should not be set arbitrarily, or the represented values will be reported incorrectly.
 */
@property (nonatomic) CGFloat majorUnitLength;

/**
 *   @property  minorTickLen
 *   @brief     Vertical length of minor tick
 *   @details   The vertical length of the minor tick in the number picker view.  The default value is
 *              10.0 pixels.
 */
@property (nonatomic) CGFloat minorTickLen;

/**
 *   @property  majorTickLen
 *   @brief     Vertical length of major tick
 *   @details   The vertical length of the major tick in the number picker view.  The default value is
 *              20.0 pixels.
 */
@property (nonatomic) CGFloat majorTickLen;

/**
 *   @property  majorTickNumFormat
 *   @brief     Number format for major tick labels
 *   @details   Format for the number at each major tick.  Uses standard NSString string format specifiers.
 *              Default format is %0.0f;
 *   @note      Formats should be based on a float value.
 */
@property (nonatomic, retain) NSString *majorTickNumFormat;

/**
 *   @property  indicatorNumFormat
 *   @brief     Number format for the number indicator
 *   @details   Format for the number shown in the view.  Uses standard NSString string format specifiers.
 *              Default format is %0.0f;
 *  @note       Formats should be based on a float value.
 */
@property (nonatomic, retain) NSString *indicatorNumFormat;

/**
 *   @property  snapsToMinorTick
 *   @brief     Scroll view snap-to-tick behavior
 *   @details   Determines whether the scroll view should snap to the nearest minor tick.
 *              The default is YES.
 */
@property (nonatomic) BOOL snapsToMinorTick;

/**
 *   @property  style
 *   @brief     Display style
 *   @details   The display style for the number picker view.  Currently supports light or dark display styles as determined by the 
 *              CCFNumberPickerStyle constants.  The default value is CCFNumberPickerStyleLight.
 */
@property (nonatomic) CCFNumberPickerStyle style;

/**
 *   @property  showsValueInScale
 *   @brief     Show represented value in the scale
 *   @details   If YES, the number picker view will display the current value in the scale.  Default is YES.
 */
@property (nonatomic) BOOL showsValueInScale;

/**
 *    @method    setMajorUnitLength:
 *    @brief     Setter for the majorUnitLength property
 *    @details   Should not be set arbitrarily or the represented values will be incorrect.
 *    @param     mul The major unit length in pixels.
 */
- (void)setMajorUnitLength:(CGFloat)mul;

/**
 *    @method    representedValueForOffset:
 *    @brief     Provides the represented value
 *    @details   Given an offset of the internal scroll view, returns the represented value bounded by the minimum 
 *               and maximum values.
 *    @param     offsetH The horizontal offset of the internal scroll view
 *    @result    The represented value
 *    @todo      Possibly this should be moved to the view hierarchy
 */
- (float)representedValueForOffset:(CGFloat)offsetH;

@end
