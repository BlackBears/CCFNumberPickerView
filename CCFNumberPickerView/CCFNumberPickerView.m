/**
 *  CCFNumberPickerView.m
 *  Copyright (c) 2011 Cocoa Factory, LLC
 */


#import "CCFNumberPickerView.h"
#import "CCFNumberPickerScrollView.h"
#import "CCFPointerView.h"
#import "CCFNumberPickerData.h"
#import "bezel-shadow.png.h"
#import <QuartzCore/QuartzCore.h>

static const CGFloat INDICATOR_HEIGHT = 30.0f;
static const CGFloat INDICATOR_H_INSET = 35.0f;
static const CGFloat INDICATOR_WIDTH = 60.0f;
static const CGFloat POINTER_VIEW_WIDTH = 10.0f;
static const CGFloat POINTER_VIEW_HEIGHT = 25.0f;
static const CGFloat BEZEL_SHADOW_HEIGHT = 6.0;
static const CGFloat BEZEL_SHADOW_WIDTH = 18.0;
static const NSTimeInterval SNAP_LATENCY = 0.2f;

@interface CCFNumberPickerView(Private)
- (void)_commonInitializationWithData:(CCFNumberPickerData *)someData;
- (void)_commonInit;
- (float)roundedOffset:(CGFloat)offsetH;
- (void)_displayCurrentValue;
- (UILabel *)indicatorLabel;
- (CCFNumberPickerScrollView *)scrollView;
- (void)_addPointerView;
- (void)_addBezelView;
- (UIImage *)_bezelShadowImage;
@end

@implementation CCFNumberPickerView

@synthesize currentValue = _currentValue;

- (id)initWithFrame:(CGRect)frame measureStripData:(CCFNumberPickerData *)someData;
{
    self = [super initWithFrame:frame];
    if( !self ) return nil;
    
    [self _commonInitializationWithData:someData];
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder;
{
    self = [super initWithCoder:aDecoder];
    if( !self ) return nil;
    
    return self;
}

//
//  Initialization tasks that are common to programmatic and nib-based instantiation
//
- (void)_commonInitializationWithData:(CCFNumberPickerData *)someData;
{
    _ASSIGN( _data, someData );
    CCFNumberPickerScrollView *scroller = [[CCFNumberPickerScrollView alloc] initWithFrame:self.bounds data:_data];
    
    _ASSIGN( _scrollView, [scroller autorelease] );
    _scrollView.delegate = self;
    [self addSubview:_scrollView];
    
    [self _addBezelView];
    
    [self _addPointerView];
    [self setBackgroundColor:[UIColor whiteColor]];
    
    //  update current value on first display
    [self scrollViewDidScroll:[self scrollView]];
}

- (id)forwardingTargetForSelector:(SEL)aSelector;
{
    id forwardObj = [self scrollView];
    return forwardObj;
}


- (void)dealloc
{
    DESTROY( _data );
    DESTROY( _scrollView );
    DESTROY( _scrollTimer );
    DESTROY( _indicatorLabel );
    [super dealloc];
}

#pragma -
#pragma Public API

//
//  Without data, we cannot construct the view hierarchy.  The designated initializer
//  takes care of handling these tasks when the view is created programmatically.  If the
//  view is instantiated in a nib, then we will handle initialization of the dependent portions of the
//  view hierarchy when the data is available.
//
- (void)setData:(CCFNumberPickerData *)someData;
{
    [self _commonInitializationWithData:someData];
}

#pragma -
#pragma View hierarchy

- (void)_addPointerView;
{
    CGRect bRect = self.bounds;
    CGRect pointerViewRect = CGRectMake(CGRectGetMidX(bRect)-POINTER_VIEW_WIDTH,
                                        CGRectGetMaxY(bRect)-POINTER_VIEW_HEIGHT,
                                        POINTER_VIEW_WIDTH, 
                                        POINTER_VIEW_HEIGHT);
    CCFPointerView *bView = [[CCFPointerView alloc] initWithFrame:pointerViewRect data:_data];
    bView.backgroundColor = [UIColor clearColor];
    bView.userInteractionEnabled = NO;
    [self insertSubview:[bView autorelease] atIndex:1];
}

- (void)_addBezelView;
{
    UIImageView *iv = [[UIImageView alloc] initWithFrame:self.bounds];
    [iv setImage:[self _bezelShadowImage]];
    [self addSubview:[iv autorelease]];
}

- (CCFNumberPickerScrollView *)scrollView;
{
    if( !_scrollView )
    {
        CCFNumberPickerScrollView *view = [[CCFNumberPickerScrollView alloc] initWithFrame:self.bounds];
        _ASSIGN( _scrollView, [view autorelease] );
        [_scrollView setDelegate:self];
        [self addSubview:_scrollView];
    }
    return _scrollView;
}

- (UILabel *)indicatorLabel;
{
    if( !_indicatorLabel )
    {
        CGRect indicatorRect = CGRectMake(INDICATOR_H_INSET, 
                                          0.5f * (self.bounds.size.height - INDICATOR_HEIGHT), 
                                          INDICATOR_WIDTH, 
                                          INDICATOR_HEIGHT);
        UILabel *aLabel = [[UILabel alloc] initWithFrame:indicatorRect];
        aLabel.backgroundColor = [UIColor clearColor];
        aLabel.font = [UIFont boldSystemFontOfSize:17];
        UIColor *labelColor = nil;
        if( _data.style == CCFNumberPickerStyleLight )
        {
            labelColor = [UIColor colorWithRed:0.223 green:0.281 blue:0.391 alpha:1.000];
        }
        else
        {
            labelColor = [UIColor lightGrayColor];
        }
        aLabel.textColor = labelColor;
        aLabel.shadowOffset = CGSizeMake(0, 1);
        aLabel.shadowColor = [UIColor colorWithRed:0.344 green:0.434 blue:0.603 alpha:1.000];
        _ASSIGN( _indicatorLabel, [aLabel autorelease] );
        [self insertSubview:_indicatorLabel atIndex:1];
    }
    return _indicatorLabel;
}


#pragma -
#pragma Scroll view delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView;
{
    if( _data.snapsToMinorTick )
    {
        NSTimer *aTimer = [NSTimer scheduledTimerWithTimeInterval:SNAP_LATENCY
                                                           target:self
                                                         selector:@selector(snapToTick:)
                                                         userInfo:nil
                                                          repeats:NO];
        _ASSIGN( _scrollTimer, aTimer );
    }
    CGPoint offset = [scrollView contentOffset];
    _currentValue = [_data representedValueForOffset:offset.x];
    [self _displayCurrentValue];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView;
{
    [_scrollTimer invalidate];
}

#pragma -
#pragma Private

- (void)_displayCurrentValue;
{
    if( !_data.showsValueInScale ) { return; }
    NSString *valString = [NSString stringWithFormat:[_data indicatorNumFormat],_currentValue];
    [[self indicatorLabel] setText:valString];
}

- (void)snapToTick:(NSTimer *)timer;
{
    CGPoint offset = [_scrollView contentOffset];
    CGFloat offsetH = offset.x;
    offsetH = [self roundedOffset:offsetH];
    [[self scrollView] setContentOffset:CGPointMake(offsetH, offset.y)];
    [self _displayCurrentValue];
}

- (float)roundedOffset:(CGFloat)offsetH;
{
    CGFloat spacing = (float)[_data minorTickSpacing];
    int offsetHi = ((int)( offsetH/spacing))*spacing;
    return (float)offsetHi;
}


- (UIImage *)_bezelShadowImage;
{
    unsigned char *pngBytes = bezel_shadow_png;
    NSUInteger pngLength = bezel_shadow_png_len;
    NSData *pngData = [NSData dataWithBytesNoCopy:pngBytes length:pngLength freeWhenDone:NO];
    UIImage *shadowImg = [[UIImage imageWithData:pngData] stretchableImageWithLeftCapWidth:BEZEL_SHADOW_WIDTH
                                                                              topCapHeight:BEZEL_SHADOW_HEIGHT];
    return shadowImg;
}

@end
