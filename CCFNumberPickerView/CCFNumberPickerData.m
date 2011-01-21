/**
 *  CCFNumberPickerData.m
 *  Copyright (c) 2011 Cocoa Factory, LLC
 */

#import "CCFNumberPickerData.h"

static const CGFloat DEFAULT_MAJOR_TICK_LEN = 20.0f;
static const CGFloat DEFAULT_MINOR_TICK_LEN = 10.0f;
static const NSString *DEFAULT_MAJOR_TICK_FORMAT = @"%0.0f";
static const NSString *DEFAULT_INDICATOR_FORMAT = @"%0.0f";
static const BOOL DEFAULT_SHOWS_VALUE_IN_SCALE = YES;

@implementation CCFNumberPickerData

@synthesize min = _min;
@synthesize max = _max;
@synthesize minorTickCount = _minorTickCount;
@synthesize minorTickSpacing = _minorTickSpacing;
@synthesize majorTickUnit = _majorTickUnit;
@synthesize scrollViewSize = _scrollViewSize;
@synthesize majorUnitLength = _majorUnitLength;
@synthesize minorTickLen = _minorTickLen;
@synthesize majorTickLen = _majorTickLen;
@synthesize majorTickNumFormat = _majorTickNumFormat;
@synthesize indicatorNumFormat = _indicatorNumFormat;
@synthesize snapsToMinorTick = _snapsToMinorTick;
@synthesize showsValueInScale = _showsValueInScale;
@synthesize style = _style;

#pragma -
#pragma Object lifecycle

- (id)init;
{
    SUPERINIT;
    
    //  setup sensible defaults
    _style = CCFNumberPickerStyleLight;
    _snapsToMinorTick = YES;
    _showsValueInScale = DEFAULT_SHOWS_VALUE_IN_SCALE;
    _minorTickLen = DEFAULT_MINOR_TICK_LEN;
    _majorTickLen = DEFAULT_MAJOR_TICK_LEN;
    _ASSIGN( _majorTickNumFormat, DEFAULT_MAJOR_TICK_FORMAT);
    _ASSIGN( _indicatorNumFormat, DEFAULT_INDICATOR_FORMAT);
    
    return self;
}

- (void)dealloc;
{
    DESTROY( _majorTickNumFormat );
    DESTROY( _indicatorNumFormat );
    [super dealloc];
}

#pragma -
#pragma Public API

- (float)representedValueForOffset:(CGFloat)offsetH;
{
    float units = offsetH * _offsetScaling;
    float value = _min + units;
    return value;
}

- (void)setMajorUnitLength:(CGFloat)mul;
{
    _majorUnitLength = mul;
    _offsetScaling = _majorTickUnit / _majorUnitLength;
}

@end
