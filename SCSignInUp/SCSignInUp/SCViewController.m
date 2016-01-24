//
//  SCViewController.m
//  SCSignInUp
//
//  Created by Michael Evensen on 4/2/14.
//  Copyright (c) 2014 SoundCloud. All rights reserved.
//

#import "SCViewController.h"
#import "SCInputViewController.h"

@interface SCViewController ()

@end

@implementation SCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    UINavigationController *nav = segue.destinationViewController;
    SCInputViewController *view = (SCInputViewController *)nav.topViewController;
    
    if([segue.identifier isEqualToString: @"openCreate"]) {
//        [view setFormTypeTo:@"Create"];
        view.formType = @"Create";
    }
    else {
//        [view setFormTypeTo:@"Sign"];
         view.formType = @"Sign";
    }
}

@end
