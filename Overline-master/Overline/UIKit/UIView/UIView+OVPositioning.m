//
//  UIView+OVPositioning.m
//  Lab-VC-Transitions
//
//  Created by Hari Karam Singh on 25/05/2014.
//  Copyright (c) 2014 Air Craft. All rights reserved.
//

#import "UIView+OVPositioning.h"

@implementation UIView (OVPositioning)

/////////////////////////////////////////////////////////////////////////
#pragma mark - Frame get/set shorthand
/////////////////////////////////////////////////////////////////////////

- (CGPoint)origin
{
    return self.frame.origin;
}

//---------------------------------------------------------------------

- (void)setOrigin:(CGPoint)origin
{
    CGRect f = self.frame;
    f.origin = origin;
    self.frame = f;
}

//---------------------------------------------------------------------

- (CGFloat)x
{
    return self.origin.x;
}

//---------------------------------------------------------------------

- (void)setX:(CGFloat)x
{
    CGRect f = self.frame;
    f.origin.x = x;
    self.frame = f;
}

//---------------------------------------------------------------------

- (CGFloat)y
{
    return self.origin.y;
}

//---------------------------------------------------------------------

- (void)setY:(CGFloat)y
{
    CGRect f = self.frame;
    f.origin.y = y;
    self.frame = f;
}

//---------------------------------------------------------------------

- (CGSize)size
{
    return self.frame.size;
}

//---------------------------------------------------------------------

- (void)setSize:(CGSize)size
{
    CGRect f = self.frame;
    f.size = size;
    self.frame = f;
}

//---------------------------------------------------------------------

- (CGFloat)width
{
    return self.size.width;
}

//---------------------------------------------------------------------

- (void)setWidth:(CGFloat)width
{
    CGRect f = self.frame;
    f.size.width = width;
    self.frame = f;
}

//---------------------------------------------------------------------

- (CGFloat)height
{
    return self.size.height;
}

//---------------------------------------------------------------------

- (void)setHeight:(CGFloat)height
{
    CGRect f = self.frame;
    f.size.height = height;
    self.frame = f;
}

//---------------------------------------------------------------------

- (CGFloat)centerX
{
    return self.center.x;
}

//---------------------------------------------------------------------

- (void)setCenterX:(CGFloat)centerX
{
    self.center = CGPointMake(centerX, self.center.y);
}

//---------------------------------------------------------------------

- (CGFloat)centerY
{
    return self.center.y;
}

//---------------------------------------------------------------------

- (void)setCenterY:(CGFloat)centerY
{
    self.center = CGPointMake(self.center.x, centerY);
}


/////////////////////////////////////////////////////////////////////////
#pragma mark - Bounds shorthand
/////////////////////////////////////////////////////////////////////////

- (CGSize)boundsSize
{
    return self.bounds.size;
}

//---------------------------------------------------------------------

- (void)setBoundsSize:(CGSize)size
{
    CGRect bounds = self.bounds;
    bounds.size = size;
    self.bounds = bounds;
}

//---------------------------------------------------------------------

- (CGFloat)boundsWidth
{
    return self.boundsSize.width;
}

//---------------------------------------------------------------------

- (void)setBoundsWidth:(CGFloat)width
{
    CGRect bounds = self.bounds;
    bounds.size.width = width;
    self.bounds = bounds;
}

//---------------------------------------------------------------------

- (CGFloat)boundsHeight
{
    return self.boundsSize.height;
}

//---------------------------------------------------------------------

- (void)setBoundsHeight:(CGFloat)height
{
    CGRect bounds = self.bounds;
    bounds.size.height = height;
    self.bounds = bounds;
}


/////////////////////////////////////////////////////////////////////////
#pragma mark - Additional setters
/////////////////////////////////////////////////////////////////////////

- (void)alignCenterHorizontally
{
    if (!self.superview) [NSException raise:NSGenericException format:@"Superview must not be nil"];
    CGPoint center = self.center;
    center.x = self.superview.frame.size.width * 0.5;
    self.center = center;
}

//---------------------------------------------------------------------

- (void)alignCenterVertically
{
    if (!self.superview) [NSException raise:NSGenericException format:@"Superview must not be nil"];
    CGPoint center = self.center;
    center.y = self.superview.frame.size.height * 0.5;
    self.center = center;
}

//---------------------------------------------------------------------

- (void)alignCenter
{
    if (!self.superview) [NSException raise:NSGenericException format:@"Superview must not be nil"];
    CGPoint center = self.center;
    center.x = self.superview.frame.size.width * 0.5;
    center.y = self.superview.frame.size.height * 0.5;
    self.center = center;    
}

//---------------------------------------------------------------------

- (void)alignRight
{
    if (!self.superview) [NSException raise:NSGenericException format:@"Superview must not be nil"];
    CGRect frame = self.frame;
    frame.origin.x = self.superview.frame.size.width - frame.size.width;
    self.frame = frame;
}

//---------------------------------------------------------------------

- (void)alignBottom
{
    if (!self.superview) [NSException raise:NSGenericException format:@"Superview must not be nil"];
    CGRect frame = self.frame;
    frame.origin.y = self.superview.frame.size.height - frame.size.height;
    self.frame = frame;
}

//---------------------------------------------------------------------


- (void)setMargins:(UIEdgeInsets)margins
{
    if (!self.superview) [NSException raise:NSGenericException format:@"Superview must not be nil"];
    CGSize superSize = self.superview.frame.size;
    self.frame = CGRectMake(margins.left,
                            margins.top,
                            superSize.width - (margins.left + margins.right),
                            superSize.height - (margins.top + margins.bottom));
}

//---------------------------------------------------------------------

- (void)setBottomMargin:(CGFloat)bottom
{
    if (!self.superview) [NSException raise:NSGenericException format:@"Superview must not be nil"];
    CGRect f = self.frame;
    f.origin.y = self.superview.frame.size.height - self.frame.size.height - bottom;
    self.frame = f;
}


@end
