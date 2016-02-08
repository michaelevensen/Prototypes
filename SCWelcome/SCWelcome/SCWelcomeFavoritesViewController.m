//
//  SCWelcomeFavoritesViewController.m
//  SCWelcome
//
//  Created by Michael Evensen on 5/16/14.
//  Copyright (c) 2014 SoundCloud. All rights reserved.
//

#import "SCWelcomeFavoritesViewController.h"

@interface SCWelcomeFavoritesViewController ()

@end

@implementation SCWelcomeFavoritesViewController

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
//    [self setOriginalPosition:self.pageContent.center];
    
    if(!self.circleView) {
        
        // Create Highlight Circle
        self.circleView = [self createHighlightCircleAtX:193.0 andY:291.0];
        
        // Add to View
        [self.view addSubview:self.circleView];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // Check if Animation is Active
    if(!self.isAnimationActive) {
        
        // Animate Highlight
        [self scaleView:self.circleView toValue:1.0 andDuration:0.4 withSpring:0.70 delay:0.3];
        
        // Animate Page Content
        [self panView:self.pageContent toValue:-260.0 andDuration:15.0 withSpring:0.0 delay:0.0];
    }
}

- (void)viewDidDisappear:(BOOL)animated
{
    // Reset
    [self resetContent:self.pageContent];
    
    // Reset Highlight Circle
    self.circleView = [self resetTransform:self.circleView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
