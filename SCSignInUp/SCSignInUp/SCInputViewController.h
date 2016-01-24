//
//  SCInputViewController.h
//  SCSignInUp
//
//  Created by Michael Evensen on 4/2/14.
//  Copyright (c) 2014 SoundCloud. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCLabel.h"
#import "SCButton.h"
#import "SCInputField.h"
#import "SCScrollView.h"

@interface SCInputViewController : UIViewController

- (void)setFormTypeTo:(NSString *)type; // form changing between "sign-in" and "create account"


@property NSString *formType;
@property (strong, nonatomic) IBOutlet SCScrollView *scrollView;

@property (strong, nonatomic) IBOutlet SCLabel *signinText;
@property (strong, nonatomic) IBOutlet SCLabel *tosText;
@property (strong, nonatomic) IBOutlet SCButton *forgotPassword;

// Social
@property (strong, nonatomic) IBOutlet SCLabel *labelFacebook;
@property (strong, nonatomic) IBOutlet SCLabel *labelGoogle;

// Input Fields
@property (strong, nonatomic) IBOutlet SCInputField *mailAddressInput;
@property (strong, nonatomic) IBOutlet SCInputField *passwordInput;

@end
