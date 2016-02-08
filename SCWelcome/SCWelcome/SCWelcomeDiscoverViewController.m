//
//  SCWelcomeExploreViewController.m
//  SCWelcome
//
//  Created by Michael Evensen on 5/21/14.
//  Copyright (c) 2014 SoundCloud. All rights reserved.
//

#import "SCWelcomeDiscoverViewController.h"

@interface SCWelcomeDiscoverViewController ()

@end

@implementation SCWelcomeDiscoverViewController

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

    // Highlight circle
    if(!self.circleView) {
        
        // Create Highlight Circle
        self.circleView = [self createHighlightCircleAtX:59.0 andY:291.0];
        
        // Add to View
        [self.view addSubview:self.circleView];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // Check if Animation is Active
    if(!self.isAnimationActive) {
        
        // Animate Page Content
        [self panView:self.pageContent toValue:-280.0 andDuration:60.0 withSpring:0.0 delay:0.3];
        
        // Animate Highlight Circle
        [self scaleView:self.circleView toValue:1.0 andDuration:0.4 withSpring:0.70 delay:0.3];
    }
}

- (void)viewDidDisappear:(BOOL)animated
{
    // Reset
    [self resetContent:self.pageContent];
    
    // Reset Highlight Circle
    self.circleView = [self resetTransform:self.circleView];
    
    [self.view.layer removeAllAnimations];
}


@end
