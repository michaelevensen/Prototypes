//
//  SCPlayerViewController.h
//  SCPlayer
//
//  Created by Michael Evensen on 4/29/14.
//  Copyright (c) 2014 SoundCloud. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCPlayerEngagementButton.h"

@interface SCPlayerViewController : UIViewController

// artwork
@property (strong, nonatomic) IBOutlet UIImageView *artwork;
@property (strong, nonatomic) IBOutlet UIImageView *blurredArtwork;

// blackbars
@property (strong, nonatomic) IBOutlet UIView *userBlackbar;
@property (strong, nonatomic) IBOutlet UIView *titleBlackbar;
@property (strong, nonatomic) IBOutlet UIView *timeIndicatorBar;

/*
 * buttons
 */

// normal (playing)
@property (strong, nonatomic) IBOutlet SCPlayerEngagementButton *normalHide;
@property (strong, nonatomic) IBOutlet SCPlayerEngagementButton *normalMore;
@property (strong, nonatomic) IBOutlet SCPlayerEngagementButton *normalLike;

// paused
@property (strong, nonatomic) IBOutlet SCPlayerEngagementButton *pausedHide;
@property (strong, nonatomic) IBOutlet SCPlayerEngagementButton *pausedMore;
@property (strong, nonatomic) IBOutlet SCPlayerEngagementButton *pausedLike;


// waveform
@property (strong, nonatomic) IBOutlet UIImageView *normalWave;
@property (strong, nonatomic) IBOutlet UIImageView *pausedWave;

// controls
@property (strong, nonatomic) IBOutlet UIButton *playButton;
@property (strong, nonatomic) IBOutlet UIButton *prevButton;
@property (strong, nonatomic) IBOutlet UIButton *nextButton;


@end
