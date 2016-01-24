//
//  SCWelcomeSearchFollowButton.m
//  SCWelcome
//
//  Created by Michael Evensen on 5/27/14.
//  Copyright (c) 2014 SoundCloud. All rights reserved.
//

#import "SCFollowButton.h"

@implementation SCFollowButton

- (void)awakeFromNib
{
    // Original position
    self.originalIconPosition = self.buttonIcon.center;
    self.originalActiveIconPosition = self.buttonActiveIcon.center;
    
    // Reset transforms
    [self resetButton];
}

#pragma mark - Animate Follow Button

- (void)animate:(BOOL)state withDuration:(float)duration delay:(float)delay
{
    [UIView animateWithDuration:duration
                          delay:delay
         usingSpringWithDamping:0.7
          initialSpringVelocity:0.0
                        options:UIViewAnimationOptionCurveEaseOut animations:^{
                            self.buttonIcon.center = CGPointMake(self.buttonIcon.center.x-30, self.buttonIcon.center.y);
                            self.buttonActiveIcon.center = CGPointMake(self.buttonActiveIcon.center.x-30, self.buttonActiveIcon.center.y);
                            self.buttonActiveFrame.transform = CGAffineTransformMakeScale(1.0, 1.0);
    } completion:^(BOOL finished) {
        //
    }];
}

#pragma mark - Reset

- (void)resetButton
{
    // Reset transforms
    [self resetTransform:self.buttonActiveFrame];
    
    // Reset positions
    if(self.originalActiveIconPosition.x!=self.buttonActiveIcon.center.x) {
        
        self.buttonIcon.center = self.originalIconPosition;
        self.buttonActiveIcon.center = self.originalActiveIconPosition;
    }
}

#pragma mark - Reset Image Transform

- (UIImageView *)resetTransform:(UIImageView *)view
{
    view.transform = CGAffineTransformMakeScale(0.0, 0.0);
    
    return view;
}

@end
