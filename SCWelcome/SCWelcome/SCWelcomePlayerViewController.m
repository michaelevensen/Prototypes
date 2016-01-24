//
//  SCWelcomePlayerViewController.m
//  SCWelcome
//
//  Created by Michael Evensen on 5/16/14.
//  Copyright (c) 2014 SoundCloud. All rights reserved.
//

#import "SCWelcomePlayerViewController.h"

@interface SCWelcomePlayerViewController ()

@end

@implementation SCWelcomePlayerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Store Original Position
    [self setOriginalPosition:self.pageContent.center];
    
    // Store Original Label Pos
    self.activeLikeLabelPos = self.activeLikeLabel.center;
    self.inactiveLikeLabelPos = self.inactiveLikeLabel.center;

    // Store Original Waveform Position
    [self setOriginalWaveformPosition:self.waveform.center];
    
    // Set initial time
    [self resetTime];
    
    // Setup timer
    [NSTimer scheduledTimerWithTimeInterval:1.0
                                     target:self
                                   selector:@selector(updateTime)
                                   userInfo:nil
                                    repeats:YES];
    
    // Slightly adjust (yes this is the designer in me)
    self.timestamp.center = CGPointMake(self.timestamp.center.x, self.timestamp.center.y-0.5);
}

- (void)resetTime
{
    self.currentMinutes = 0;
    self.currentSeconds = 0;
}

- (void)updateTime
{
    self.currentSeconds++;
    
    // Stop for max time
    if(self.currentMinutes==4 && self.currentSeconds==46) {
        return;
    }
    
    if(self.currentSeconds>59) {
        self.currentMinutes++;
        self.currentSeconds = 0;
    }
    
    // Set time
    if(self.currentSeconds<10)
    {
        self.currentDuration.text = [NSString stringWithFormat:@"%d:0%d", self.currentMinutes, self.currentSeconds];
    } else {
        self.currentDuration.text = [NSString stringWithFormat:@"%d:%d", self.currentMinutes, self.currentSeconds];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // Check if Animation is Active
    if(!self.isAnimationActive) {
        
        // Animate Waveform
        [self animateWaveform];
        
        // Animate Like
        [self resetTransform:self.smallLike];
        [self scaleView:self.smallLike toValue:1.0 andDuration:0.5 withSpring:0.7 delay:0.5];
        
        // Animate Active Like Label
        [self panView:self.activeLikeLabel toValue:8.0 andDuration:0.5 withSpring:0.7 delay:0.5];
        [self panView:self.inactiveLikeLabel toValue:25.0 andDuration:0.5 withSpring:0.7 delay:0.5];
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    // Reset
    [self resetContent:self.pageContent with:self.originalPosition];

    // Cancel Panning performSelector
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    
    // Reset Time
    [self resetTime];
    
    // Reset Active Follow Button (Orange)
    [self resetTransform:self.smallLike];
    self.activeLikeLabel.center = self.activeLikeLabelPos;
    self.inactiveLikeLabel.center = self.inactiveLikeLabelPos;
    
    // Reset Waveform
    self.waveform.center = self.originalWaveformPosition;
    
    [self.waveformActiveFrame setFrame:CGRectMake(self.waveformActiveFrame.frame.origin.x,
                                                  self.waveformActiveFrame.frame.origin.y,
                                                  20.0,
                                                  self.waveformActiveFrame.frame.size.height)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Animate Waveform

- (void)animateWaveform
{
    // Set State for Animation
    self.isAnimationActive = YES;
    
    // Waveform Size
    CGFloat waveformSizeValue = 423;
    
    // Animate Waveform
    [UIView animateWithDuration:100.0
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         
                         // Scale Active
                         [self.waveformActiveFrame setFrame:CGRectMake(self.waveformActiveFrame.frame.origin.x,
                                                                   self.waveformActiveFrame.frame.origin.y,
                                                                   self.waveformActiveFrame.frame.size.width+waveformSizeValue,
                                                                   self.waveformActiveFrame.frame.size.height)];
                         
                         // Move Waveform
                         self.waveform.center = CGPointMake(self.waveform.center.x-waveformSizeValue,
                                                            self.waveform.center.y);
                         
                         
                     }
                     completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
