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
    
    // Add Mask to Frame
//    [self addMaskTo:self.pageFrame];
    
    // Store Original Position
    [self setOriginalPosition:self.pageContent.center];
    
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
        [self panView:self.pageContent toValue:25.0 andDuration:60.0 withSpring:0.0 delay:0.3];
        
        // Animate Highlight Circle
        [self scaleView:self.circleView toValue:1.0 andDuration:0.4 withSpring:0.70 delay:0.3];
    }
}

- (void)viewDidDisappear:(BOOL)animated
{
    // Reset
    [self resetContent:self.pageContent with:self.originalPosition];
    
    // Reset Highlight Circle
    self.circleView = [self resetTransform:self.circleView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
