//
//  SCUsernameViewController.h
//  SCSignInUp
//
//  Created by Michael Evensen on 4/5/14.
//  Copyright (c) 2014 SoundCloud. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCInputField.h"
#import "SCScrollView.h"

@interface SCUsernameViewController : UIViewController

@property (strong, nonatomic) IBOutlet SCInputField *usernameInput;
@property (strong, nonatomic) IBOutlet SCScrollView *scrollView;

@end
