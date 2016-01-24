//
//  SCWelcomeFavoritesViewController.h
//  SCWelcome
//
//  Created by Michael Evensen on 5/16/14.
//  Copyright (c) 2014 SoundCloud. All rights reserved.
//

#import "SCWelcomeAnimationViewController.h"

@interface SCWelcomeFavoritesViewController : SCWelcomeAnimationViewController

// Page Index
@property NSUInteger pageIndex;

// Original Position
@property CGPoint originalPosition;

// Page Content
@property (strong, nonatomic) IBOutlet UIView *pageContent;

// Highlight Circle
@property UIView *circleView;

@end
