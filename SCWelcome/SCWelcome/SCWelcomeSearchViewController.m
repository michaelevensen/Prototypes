//
//  SCWelcomeSearchViewController.m
//  SCWelcome
//
//  Created by Michael Evensen on 5/21/14.
//  Copyright (c) 2014 SoundCloud. All rights reserved.
//

#import "SCWelcomeSearchViewController.h"

@interface SCWelcomeSearchViewController ()

@end

@implementation SCWelcomeSearchViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
       
        //
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Follow Buttons
    self.followButtons = [[NSMutableArray alloc] init];
    
    // Store Original Position
//    [self setOriginalPosition:self.pageContent.center];
    
    if(!self.circleView) {
        
        // Create Highlight Circle
        self.circleView = [self createHighlightCircleAtX:126.0 andY:291.0];
        
        // Add to View
        [self.view addSubview:self.circleView];
    }
}

- (void)addFollowButtonAtPoint:(CGPoint)point delay:(float)delay
{
    // New Following Button
    SCWelcomeFollowButton *follow = [[SCWelcomeFollowButton alloc] init];
    [self.view addSubview:follow];
    
    // Add to array
    [self.followButtons addObject:follow];

    // Position
    follow.center = point;
    
    // Animate Follow
    [follow.followButton animate:YES withDuration:0.5 delay:delay];
}

- (void)resetFollowingButtons
{
   for(SCWelcomeFollowButton *button in self.followButtons) {
    
        [button.followButton resetButton];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
 
    // Check if Animation is Active
    if(!self.isAnimationActive) {
        
        // Animate Highlight
        [self scaleView:self.circleView toValue:1.0 andDuration:0.4 withSpring:0.70 delay:0.3];
    
        // Add Following Buttons
        [self addFollowButtonAtPoint:CGPointMake(245, 34) delay:1.2];
        [self addFollowButtonAtPoint:CGPointMake(245, 120) delay:1.4];
        [self addFollowButtonAtPoint:CGPointMake(245, 205) delay:1.6];
    }
}

- (void)viewDidDisappear:(BOOL)animated
{
    // Reset
    [self resetContent:self.pageContent];
    
    // Cancel Active following performSelector
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    
    // Reset Follow buttons
    [self resetFollowingButtons];
    
    // Reset Highlight Circle
    self.circleView = [self resetTransform:self.circleView];
}

@end
