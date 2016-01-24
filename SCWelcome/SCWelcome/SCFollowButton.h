//
//  SCWelcomeSearchFollowButton.h
//  SCWelcome
//
//  Created by Michael Evensen on 5/27/14.
//  Copyright (c) 2014 SoundCloud. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SCFollowButton : UIView

- (void)animate:(BOOL)state withDuration:(float)duration delay:(float)delay;
- (void)resetButton;

@property (strong, nonatomic) IBOutlet UIImageView *buttonFrame;
@property (strong, nonatomic) IBOutlet UIImageView *buttonIcon;
@property (strong, nonatomic) IBOutlet UIImageView *buttonActiveFrame;
@property (strong, nonatomic) IBOutlet UIImageView *buttonActiveIcon;

// Original Values
@property CGPoint originalIconPosition;
@property CGPoint originalActiveIconPosition;

@end
