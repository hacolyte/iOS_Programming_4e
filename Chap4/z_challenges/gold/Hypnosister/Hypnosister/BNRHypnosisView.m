//
//  BNRHypnosisView.m
//  Hypnosister
//
//  Created by Benjamin Pearson on 12/31/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import "BNRHypnosisView.h"

@implementation BNRHypnosisView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // All BNRHypnosisViews start with a clear background color
        self.backgroundColor = [UIColor clearColor];
    }
    
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGRect bounds = self.bounds;
    
    // Figure out the center of the bounds rectangle
    CGPoint center;
    
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    // The largest circle will circumscribe the view
    float maxRadius = hypotf(bounds.size.width, bounds.size.height) / 2;
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) {
        // Move the point so that there is not a line connecting the circles
        [path moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
        
        [path addArcWithCenter:center
                        radius:currentRadius
                    startAngle:0.0
                      endAngle:M_PI * 2.0
                     clockwise:YES];
    }
    
    // Configure line width to 10 points
    path.lineWidth = 10;
    
    // Configure the drawing color to light gray
    [[UIColor lightGrayColor] setStroke];
    
    // Draw the line!
    [path stroke];
    
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    
    CGContextSaveGState(currentContext);
    
    CGFloat locations[] = { 0.0, 1.0 };
    CGFloat components [] = { 0.0, 1.0, 0.0, 1.0,  // Start color is red
        1.0, 1.0, 0.0, 1.0 }; // End color is yellow
    
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorspace, components, locations, 2);
    
    UIBezierPath *trianglePath = [[UIBezierPath alloc] init];
    
    [trianglePath moveToPoint:CGPointMake(center.x, center.y - 150)];
    [trianglePath addLineToPoint:CGPointMake(center.x - 125, center.y + 150)];
    [trianglePath addLineToPoint:CGPointMake(center.x + 125, center.y + 150)];
    
    CGPoint startPoint;
    startPoint.x = center.x;
    startPoint.y = center.y - 150;
    CGPoint endPoint;
    endPoint.x = center.x;
    endPoint.y = center.y + 150;
    
    [trianglePath addClip];
    CGContextDrawLinearGradient(currentContext, gradient, startPoint, endPoint, 0);
    
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorspace);
    
    CGContextRestoreGState(currentContext);
    
    CGContextSaveGState(currentContext);
    CGContextSetShadow(currentContext, CGSizeMake(15,28), 3);

    UIImage *logoImage = [UIImage imageNamed:@"logo.png"];
    
    CGRect imageRect = CGRectMake(center.x - logoImage.size.width / 4.0, center.y - logoImage.size.height / 4.0, logoImage.size.width / 2.0, logoImage.size.height / 2.0);
    
    [logoImage drawInRect:imageRect];
    
    CGContextRestoreGState(currentContext);

}

@end
