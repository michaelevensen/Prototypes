//
//  SCPlayerViewController.m
//  SCPlayer
//
//  Created by Michael Evensen on 4/29/14.
//  Copyright (c) 2014 SoundCloud. All rights reserved.
//

#import "SCPlayerViewController.h"

BOOL __state = YES; // animation state

@interface SCPlayerViewController ()

@end

@implementation SCPlayerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [UIView animateWithDuration:0.20
                          delay:0.0
                        options:(__state ? UIViewAnimationOptionCurveEaseOut : UIViewAnimationOptionCurveEaseIn)
                     animations:^{
                         
                         // waveform
                         self.normalWave.alpha = (__state ? 0 : 1);
                         
                         /*
                          * off
                          */
                         self.userBlackbar.alpha = (__state ? 0 : 1);
                         self.titleBlackbar.alpha = (__state ? 0 : 1);
                         self.timeIndicatorBar.alpha = (__state ? 0 : 1);
                         
                         // buttons
                         self.normalMore.alpha = (__state ? 0 : 1);
                         self.normalLike.alpha = (__state ? 0 : 1);
                         self.normalHide.alpha = (__state ? 0 : 1);
                         
                         /*
                          * on
                          */
                         self.pausedWave.alpha = (__state ? 1 : 0);
                         self.blurredArtwork.alpha = (__state ? 1 : 0);
                         
                         
                         // play controls
                         self.playButton.alpha = (__state ? 1 : 0);
                         self.nextButton.alpha = (__state ? 1 : 0);
                         self.prevButton.alpha = (__state ? 1 : 0);
                         
                         // buttons
                         self.pausedMore.alpha = (__state ? 1 : 0);
                         self.pausedLike.alpha = (__state ? 1 : 0);
                         self.pausedHide.alpha = (__state ? 1 : 0);
                         
                         self.pausedMore.hidden = NO;
                         self.pausedLike.hidden = NO;
                         self.pausedHide.hidden = NO;
                         
                         
    } completion:^(BOOL finished) {
        __state = (__state ? NO : YES);
    }];
    
}

@end
