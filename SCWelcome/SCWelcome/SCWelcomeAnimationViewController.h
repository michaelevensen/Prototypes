//
//  SCWelcomeAnimationViewController.h
//  SCWelcome
//
//  Created by Michael Evensen on 5/16/14.
//  Copyright (c) 2014 SoundCloud. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SCWelcomeAnimationViewController : UIViewController

// Interface
- (void)resetContent:(UIView *)content with:(CGPoint)originalPoint;
- (void)panView:(UIView *)view toValue:(CGFloat)value andDuration:(CGFloat)duration withSpring:(CGFloat)spring delay:(CGFloat)delay;
- (void)scaleView:(UIView *)view toValue:(CGFloat)value andDuration:(CGFloat)duration withSpring:(CGFloat)spring delay:(CGFloat)delay;
- (void)addMaskTo:(UIView *)frame;
- (UIView *)createHighlightCircleAtX:(CGFloat)x andY:(CGFloat)y;
- (UIView *)resetTransform:(UIView *)view;

// Animation
@property BOOL isAnimationActive;

// Page Index
@property NSUInteger pageIndex;

@end
