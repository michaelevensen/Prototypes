//
//  SCInputField.h
//  SCSignInUp
//
//  Created by Michael Evensen on 4/3/14.
//  Copyright (c) 2014 SoundCloud. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCInput.h"

@interface SCInputField : UIView

- (void)showCheckmark:(BOOL)state;
- (void)showSpinner:(BOOL)state;
- (void)setFocus:(BOOL)state;
- (BOOL)performValidation;
- (void)showValidationError:(BOOL)state;

@property (nonatomic) SCInput *input;
@property BOOL doesValidate;
@property BOOL validated;
@property BOOL activeValidation;

@end
