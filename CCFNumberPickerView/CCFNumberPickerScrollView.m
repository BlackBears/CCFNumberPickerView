//
//  CCFMeasureScrollView.m
//  CCFMeasureStrip
//
//  Created by Alan Duncan on 1/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CCFNumberPickerData.h"
#import "CCFNumberPickerScrollView.h"
#import "CCFNumberPickerContentView.h"

@interface CCFNumberPickerScrollView(Private)
- (float)_contentWidth;
@end

@implementation CCFNumberPickerScrollView

@synthesize stripView = _stripView;

- (id)initWithFrame:(CGRect)frame data:(CCFNumberPickerData *)someData;
{
    self = [super initWithFrame:frame];
    if( !self ) return nil;
    if( !someData ) return nil;
    
    _ASSIGN( _data, someData );
    
    // compute size of content view
    CGRect innerViewRect = CGRectMake(0, 0, [self _contentWidth], self.bounds.size.height);
    _data.scrollViewSize = self.bounds.size.width;
    
    //  add the content view and retain it
    CCFNumberPickerContentView *aContentView = nil;
    aContentView = [[CCFNumberPickerContentView alloc] initWithFrame:innerViewRect data:_data];
    self.backgroundColor = [UIColor redColor];
    _ASSIGN(_stripView, [aContentView autorelease] );
    [self addSubview:_stripView];
    [self setContentSize:innerViewRect.size];
    
    self.showsHorizontalScrollIndicator = NO;
    
    return self;
}


- (void)dealloc
{
    DESTROY( _data );
    DESTROY( _stripView );
    [super dealloc];
}


- (id)forwardingTargetForSelector:(SEL)aSelector;
{
    return _stripView;
}

#pragma -
#pragma Public API


#pragma -
#pragma Private

- (float)_contentWidth;
{
    CGFloat padding = self.bounds.size.width;
    float range = _data.max - _data.min;
    float majorUnitCount = range / _data.majorTickUnit;
    float majorUnitLength = _data.minorTickSpacing * _data.minorTickCount;
    float numberContentWidth = majorUnitCount * majorUnitLength;
    float contentWidth = numberContentWidth + padding;
    return contentWidth;
}

@end
