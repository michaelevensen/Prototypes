//
//  SCWelcomePlayerViewController.h
//  SCWelcome
//
//  Created by Michael Evensen on 5/16/14.
//  Copyright (c) 2014 SoundCloud. All rights reserved.
//

#import "SCWelcomeAnimationViewController.h"
#import "SCButton.h"
#import "SCLabel.h"

@interface SCWelcomePlayerViewController : SCWelcomeAnimationViewController

// Original Position
//@property CGPoint originalPosition;

// Page Content
@property (strong, nonatomic) IBOutlet UIView *pageContent;

// Page Frame
@property (strong, nonatomic) IBOutlet UIView *pageFrame;

// Waveform
@property (strong, nonatomic) IBOutlet UIView *waveformActiveFrame;
@property (strong, nonatomic) IBOutlet UIImageView *waveformInactive;
@property (strong, nonatomic) IBOutlet UIImageView *waveformActive;
@property (strong, nonatomic) IBOutlet UIView *waveform;

// Timestamp
@property int currentMinutes;
@property int currentSeconds;
@property (strong, nonatomic) IBOutlet UIView *timestamp;
@property (strong, nonatomic) IBOutlet UILabel *totalDuration;
@property (strong, nonatomic) IBOutlet UILabel *currentDuration;

// Like Animation
@property (strong, nonatomic) IBOutlet UIImageView *smallLike;
@property (strong, nonatomic) IBOutlet UIImageView *activeLikeLabel;
@property (strong, nonatomic) IBOutlet SCLabel *inactiveLikeLabel;
@property CGPoint activeLikeLabelPos;
@property CGPoint inactiveLikeLabelPos;

@property CGPoint originalWaveformPosition;

@end
