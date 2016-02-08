//
//  SCWelcomeAnimationViewController.m
//  SCWelcome
//
//  Created by Michael Evensen on 5/16/14.
//  Copyright (c) 2014 SoundCloud. All rights reserved.
//

#import "SCWelcomeAnimationViewController.h"

@interface SCWelcomeAnimationViewController ()

@end

@implementation SCWelcomeAnimationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //
    }
    return self;
}

#pragma mark - Reset

- (void)resetContent:(UIView *)content
{   
    // Set State for Animation
    self.isAnimationActive = NO;
    
    // Cancel All Animations
    [self.view.layer removeAllAnimations];
    
    // Reset Page Content Pan
    content.frame = CGRectOffset(content.frame, 0, 0);
}

#pragma mark - Pan Animation

- (void)panView:(UIView *)view toValue:(CGFloat)value andDuration:(CGFloat)duration withSpring:(CGFloat)spring delay:(CGFloat)delay
{
    // Set State for Animation
    self.isAnimationActive = YES;
    
    // Spring Animation (For Popups)
    if(spring) {
    
        [UIView animateWithDuration:duration
                              delay:delay
             usingSpringWithDamping:spring
              initialSpringVelocity:0.5
                            options:UIViewAnimationOptionCurveEaseOut
                         animations:^{
                             
                             view.frame = CGRectOffset(view.frame, 0, value);
                             
                             NSLog(@"%f", value);
                        
                            
                         }
                         completion:nil];

    }
    
    // Normal Animation
    else {
        
        [UIView animateWithDuration:duration
                              delay:delay
                            options:UIViewAnimationOptionCurveEaseOut
                         animations:^{
                             
                             view.frame = CGRectOffset(view.frame, 0, value);
                             
                             NSLog(@"%f", value);
                             
                         }
                         completion:nil];
    }
}

#pragma mark - Scale Animation

- (void)scaleView:(UIView *)view toValue:(CGFloat)value andDuration:(CGFloat)duration withSpring:(CGFloat)spring delay:(CGFloat)delay
{
    // Set State for Animation
    self.isAnimationActive = YES;
    
    // Animate
    [UIView animateWithDuration:duration
                          delay:delay
         usingSpringWithDamping:spring
          initialSpringVelocity:0.5
                        options:UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         
                         view.transform = CGAffineTransformMakeScale(value, value);
                     }
                     completion:nil];
}

#pragma mark - Mask

- (void)addMaskTo:(UIView *)frame
{
    CALayer *mask = [CALayer layer];
    UIImage *image = [UIImage imageNamed:@"Content Mask.png"];
    
    mask.contents = (id)image.CGImage;
    
    // Set Mask Size
    mask.frame = CGRectMake(0, 0, image.size.width, image.size.height);
    
    // Add Mask
    frame.layer.mask = mask;
    frame.layer.masksToBounds = YES;
}

#pragma mark - Highlight Circle

- (UIView *)createHighlightCircleAtX:(CGFloat)x andY:(CGFloat)y
{
    // Radius
    int radius = 31;
    
    CAShapeLayer *c = [CAShapeLayer layer];
    
    // Make Circle path
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 2.0*radius, 2.0*radius) cornerRadius:radius];
    c.path = path.CGPath;
    
    // Set Bounds
    c.bounds = path.bounds;
    
    // Position
    c.position = CGPointMake(radius, radius);
    
    c.fillColor = [UIColor clearColor].CGColor;
    c.strokeColor = [UIColor colorWithRed:1 green:0.333 blue:0 alpha:1].CGColor; /*#ff5500*/
    c.lineWidth = 0.5;
    
    /*
     * Make Circle View
     */
    UIView *view = [[UIView alloc] initWithFrame:c.bounds];
    [view.layer addSublayer:c];
    view.center = CGPointMake(x, y);
    
    // Hide Circle on Init
    view.transform = CGAffineTransformMakeScale(0.0, 0.0);
    
    return view;
}

- (UIView *)resetTransform:(UIView *)view
{
    view.transform = CGAffineTransformMakeScale(0.0, 0.0);
    
    return view;
}

@end
