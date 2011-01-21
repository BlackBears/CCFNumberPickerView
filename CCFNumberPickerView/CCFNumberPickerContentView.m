//
//  CCFMeasureStripContentView.m
//  CCFMeasureStrip
//
//  Created by Alan Duncan on 1/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CCFNumberPickerData.h"
#import "CCFNumberPickerContentView.h"

static const CGFloat LABEL_FONT_SIZE = 13.0f;
static const CGFloat LABEL_H_ADJUST = 5.0f;
static const CGFloat LABEL_V_ADJUST = -12.0f;


CGFloat ComputeMajorTickPosition( int index, CCFNumberPickerData *data, CCFNumberPickerContentView *self );
CGFloat ComputeMinorTickPosition( CGFloat basePosition, int index, CGFloat spacing, BOOL fillForward);

@interface CCFNumberPickerContentView(Private)
- (void)drawTickLabelNumber:(CGFloat)i atPosition:(CGFloat)position usingFont:(UIFont *)labelFont inContext:(CGContextRef)ctx;
- (void)drawMajorTicksAtHPosition:(CGFloat)hPos inContext:(CGContextRef)ctx;
- (void)drawMinorTicksAtHPosition:(CGFloat)hPos inContext:(CGContextRef)ctx;
- (CGFloat)hPositionForMin;
- (CGFloat)hPositionForMax;
- (CGFloat)viewHPosForValue:(CGFloat)aValue;
- (CGFloat)valueForViewHPos:(CGFloat)viewHPos;
@end

@implementation CCFNumberPickerContentView

- (id)initWithFrame:(CGRect)frame data:(CCFNumberPickerData *)someData;
{
    self = [super initWithFrame:frame];
    if( !self ) return nil;
    if( !someData ) return nil;
    
    _ASSIGN( _data, someData );
    
    //  cache some values for efficiency during scrolling
    _data.majorUnitLength = _data.minorTickSpacing * _data.minorTickCount;
    _cachedScale = _data.majorTickUnit / _data.majorUnitLength;
    _bottom = CGRectGetMaxY(self.bounds);
    _positionAdjustment = 0.5f * _data.scrollViewSize - 5.0;
    
    if( _data.style == CCFNumberPickerStyleLight )
    {
        self.backgroundColor = [UIColor whiteColor];
    }
    else
    {
        self.backgroundColor = [UIColor blackColor];
    }
    
    return self;
}

- (void)dealloc
{
    DESTROY( _data );
    [super dealloc];
}

#pragma -
#pragma Public API



#pragma -
#pragma Drawing

#define DRAW_STRIPES 0

- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
#if DRAW_STRIPES
    for( CGFloat index = 0.0; index < CGRectGetMidY(rect); index += 2.0f )
    {        
        [self drawDarkStripesForIndex:index inRect:rect inContext:ctx];
        [self drawLightStripesForIndex:index inRect:rect inContext:ctx];
    }
#endif
    CGFloat minorPos = 0;
    UIFont *labelFont = [UIFont systemFontOfSize:LABEL_FONT_SIZE];
    
    for( float i = _data.min; i <= _data.max; i+= _data.majorTickUnit )
    {
        CGFloat position = ComputeMajorTickPosition(i, _data, self);
        //NSLog(@"i = %0.2f, hPos = %0.2f",i,position);
        [self drawTickLabelNumber:i atPosition:position usingFont:labelFont inContext:ctx];
        
        //  draw minor ticks forward of current major tick
        for( int j = 1; j < _data.minorTickCount; j++ )
        {
            minorPos = ComputeMinorTickPosition(position, j, _data.minorTickSpacing,YES);
            [self drawMinorTicksAtHPosition:minorPos inContext:ctx];
        }
    }
    //  fill in ticks on the right of the strip
    CGFloat hPos = minorPos + _data.minorTickSpacing;
    while( hPos < self.bounds.size.width )
    {
        [self drawMajorTicksAtHPosition:hPos inContext:ctx];
        for( int j = 1; j < _data.minorTickCount; j++ )
        {
            CGFloat minorPos = ComputeMinorTickPosition(hPos, j, _data.minorTickSpacing,YES);
            [self drawMinorTicksAtHPosition:minorPos inContext:ctx];
        }
        hPos += _data.majorUnitLength;
    }
    
    //  fill in ticks on the left of the strip
    hPos = _positionAdjustment;
    while( hPos > 0 )
    {
        [self drawMajorTicksAtHPosition:hPos inContext:ctx];
        
        for( int j = _data.minorTickCount; j > 0; j-- )
        {
            CGFloat minorPos = ComputeMinorTickPosition(hPos, j, _data.minorTickSpacing,NO);
            [self drawMinorTicksAtHPosition:minorPos inContext:ctx];
        }
        hPos -= _data.majorUnitLength;
    }
}

- (void)drawTickLabelNumber:(CGFloat)i atPosition:(CGFloat)position usingFont:(UIFont *)labelFont inContext:(CGContextRef)ctx;
{
    [self drawMajorTicksAtHPosition:position inContext:ctx];
    
    NSString *label =[NSString stringWithFormat:_data.majorTickNumFormat,i];
    CGPoint labelPoint = CGPointMake(position + LABEL_H_ADJUST, _data.majorTickLen + LABEL_V_ADJUST);
    UIColor *labelColor = nil;
    if( _data.style == CCFNumberPickerStyleLight )
    {
        labelColor = [UIColor blackColor];
    }
    else 
    {
        labelColor = [UIColor whiteColor];
    }
    
    CGContextSetFillColorWithColor(ctx, [labelColor CGColor] );
    [label drawAtPoint:labelPoint withFont:labelFont];
}



- (void)drawMajorTicksAtHPosition:(CGFloat)hPos inContext:(CGContextRef)ctx;
{
    UIColor *tickColor = nil;
    if( _data.style == CCFNumberPickerStyleLight )
    {
        tickColor = [UIColor blackColor];
    }
    else
    {
        tickColor = [UIColor whiteColor];
    }
    CGContextMoveToPoint(ctx, hPos, 0);
    CGContextAddLineToPoint(ctx, hPos, _data.majorTickLen);
    CGContextSetLineWidth(ctx, 2.0);
    CGContextSetStrokeColorWithColor(ctx, [tickColor CGColor] );
    CGContextStrokePath(ctx);
    
    CGContextMoveToPoint(ctx, hPos, _bottom);
    CGContextAddLineToPoint(ctx, hPos, _bottom - _data.majorTickLen);
    CGContextSetStrokeColorWithColor(ctx, [tickColor CGColor] );
    CGContextStrokePath(ctx);
}

- (void)drawMinorTicksAtHPosition:(CGFloat)minorPos inContext:(CGContextRef)ctx;
{
    UIColor *tickColor = nil;
    if( _data.style == CCFNumberPickerStyleLight )
    {
        tickColor = [UIColor lightGrayColor];
    }
    else
    {
        tickColor = [UIColor whiteColor];
    }
    CGContextMoveToPoint(ctx, minorPos, 0);
    CGContextAddLineToPoint(ctx, minorPos, _data.minorTickLen);
    CGContextSetLineWidth(ctx, 1);
    CGContextSetStrokeColorWithColor(ctx, [tickColor CGColor] );
    CGContextStrokePath(ctx);
    
    CGContextMoveToPoint(ctx, minorPos, _bottom);
    CGContextAddLineToPoint(ctx, minorPos, _bottom - _data.minorTickLen);
    CGContextSetLineWidth(ctx, 1);
    CGContextSetStrokeColorWithColor(ctx, [tickColor CGColor] );
    CGContextStrokePath(ctx);
}


#pragma -
#pragma Private

CGFloat ComputeMajorTickPosition( int index, CCFNumberPickerData *data, CCFNumberPickerContentView *self )
{
    return (index - data.min) / data.majorTickUnit * data.majorUnitLength + self->_positionAdjustment;
}

CGFloat ComputeMinorTickPosition( CGFloat basePosition, int index, CGFloat spacing, BOOL fillForward)
{
    if( !fillForward ) { index = -index; }
    return basePosition + index * spacing;
}

@end
