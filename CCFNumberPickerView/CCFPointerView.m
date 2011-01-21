//
//  CCFMeasureBezelView.m
//  CCFMeasureStrip
//
//  Created by Alan Duncan on 1/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CCFPointerView.h"
#import "CCFNumberPickerData.h"
#import <QuartzCore/QuartzCore.h>

@implementation CCFPointerView

- (id)initWithFrame:(CGRect)frame data:(CCFNumberPickerData *)someData;
{
    if( !someData ) return nil;
    self = [super initWithFrame:frame];
    if (self) {
        _ASSIGN( _data, someData );
        self.layer.shadowColor = [[UIColor blackColor] CGColor];
        self.layer.shadowOpacity = 0.25;
        self.layer.shadowRadius = 2.0;
        self.layer.shadowOffset = CGSizeMake(1, 0);
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGFloat midH = CGRectGetMidX(rect);
    CGFloat maxV = CGRectGetMaxY(rect);
    CGContextMoveToPoint(ctx, midH, maxV);
    CGContextAddLineToPoint(ctx, midH, maxV - 25);
    CGColorRef colorRef = NULL;
    colorRef = [[UIColor colorWithRed:0.672 green:0.127 blue:0.083 alpha:1.000] CGColor];
    CGContextSetStrokeColorWithColor(ctx, colorRef);
    CGContextSetLineWidth(ctx, 3);
    CGContextStrokePath(ctx);
}

- (void)dealloc
{
    [super dealloc];
}

@end
