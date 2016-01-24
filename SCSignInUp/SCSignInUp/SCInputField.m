//
//  SCInputField.m
//  SCSignInUp
//
//  Created by Michael Evensen on 4/3/14.
//  Copyright (c) 2014 SoundCloud. All rights reserved.
//

#import "SCInputField.h"

float animationSpeed = 0.3; // Set animation speed
NSString *viewType;

@implementation SCInputField

// Init with Custom XIB
- (id)initWithCoder:(NSCoder *)aDecoder {
    
    if ((self = [super initWithCoder:aDecoder])){
        
        // Setup XIB
        self.input = [[[NSBundle mainBundle] loadNibNamed:@"SCInput" owner:self options:nil] objectAtIndex:0];
        
        // Add to View (under top and bottom stroke)
        [self addSubview:self.input];
        [self sendSubviewToBack:self.input];
        
        // View Type
        [self setupInputWithViewType: [self setType]];
        
        // Add gesture recognizer (for increase hitfield)
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapDetected:)];
        [self addGestureRecognizer:tap];
        
        // Add listeners for Text Input
        [self.input.inputText addTarget:self action:@selector(textFieldDidChange) forControlEvents:UIControlEventEditingChanged];
        [self.input.inputText addTarget:self action:@selector(textFieldDidEndEditing) forControlEvents:UIControlEventEditingDidEnd];
        [self.input.inputText addTarget:self action:@selector(textFieldDidBeginEditing) forControlEvents:UIControlEventEditingDidBegin];
    }
    
    return self;
}

- (void)tapDetected:(UIGestureRecognizer *)sender {
    
    [self setFocus:YES];
}

#pragma mark - First Responder

/*
 * Set TextFields First responder
 */

- (void)setFocus:(BOOL)state {

    (state ? [self.input.inputText becomeFirstResponder] : [self.input.inputText resignFirstResponder]);
}

#pragma mark - Spinner and Checkmark

/*
 * Show spinner (for loading states)
 * - Should not show validation for loading state
 */
- (void)showSpinner:(BOOL)state {
    
    // Hide checkmark if visible when showing Spinner
    if(self.input.inputCheckmark.alpha && state) {
        [self showCheckmark:NO];
    }
    
    [UIView animateWithDuration:animationSpeed animations:^{
        self.input.inputIndicator.alpha = (state ? 1 : 0);
    }];
    
    // animate
    [self.input.inputIndicator startAnimating];
}

/*
 * Checkmark control
 */
- (void)showCheckmark:(BOOL)state {
    
    // Hide spinner if visible when showing checkmark
    if(self.input.inputIndicator.alpha && state) {
        [self showSpinner:NO];
    }
    
    [UIView animateWithDuration:animationSpeed animations:^{
        self.input.inputCheckmark.alpha = (state ? 1 : 0);
    }];
}

#pragma mark - Textfield editing

/*
 * Typing logic
 */

-(void)textFieldDidBeginEditing {
    
    // Remove validation error for beginning of input (not empty)
   [self showValidationError:NO];
}

-(void)textFieldDidEndEditing {
    
    // Show Validation error if not valid.
    [self showValidationError:YES];
}

-(void)textFieldDidChange {
    
    // Validate while typing (shows checmarks if validated)
    [self performValidation];
}

#pragma mark - Input Validation

/*
 * Perform Input Validation
 * - If field is validated set to a specific state w/ Checkmark and no re-occuring validation.
 * - Currently successfully validates if input field contains more than 5 characters.
 * - Input field must be set to doesValidate = YES to show validation error
 */
- (void)showValidationError:(BOOL)state {
    
    if(![self performValidation] && self.input.inputText.text.length>0 && self.doesValidate) {
    
        // Validation text position
        CGFloat validationTextPosition = self.input.inputText.center.y;
        validationTextPosition = (validationTextPosition + (state ? -5 : +5));

        // Animate Validation Text
        [UIView animateWithDuration:0.3 animations:^{
            self.input.inputText.center = CGPointMake(self.input.inputText.center.x, validationTextPosition);
            self.input.inputValidation.alpha = (state ? 1 : 0);
        }];
    }
}

- (BOOL)performValidation {
    
    BOOL state;
    
    // Succesfully validates on doesValidate = YES and text length longer than 5 characters
    if(self.doesValidate && self.input.inputText.text.length>5) {
        state = YES;
    }
    else {
        state = NO;
    }
    
    // Show checkmarks if successfully validated
    [self showCheckmark:state];
    
    // Set validation status
    self.validated = state;
    
    return state;
}

#pragma mark - Input Field Setup

/*
 * Find and set Input Type based on Tag
 * 10 - Mail
 * 11 - Mail wo/ validation
 * 20 - Password
 * 30 - Username (does not validate)
 */
- (NSString *)setType {

    switch (self.tag) {
            
        // Mail
        case 10:
            viewType = @"Mail";
            break;
            
        // Password
        case 20:
            viewType = @"Password";
            break;
            
        // Username
        case 30:
            viewType = @"Username";
            break;
            
        // Default is Mail
        default:
            viewType = @"Mail";
            break;
    }
    
    return viewType;
}

/*
 * Setup View based on Input type
 */
- (void)setupInputWithViewType:(NSString *)type {
    
    NSString *placeholderText;
    NSString *labelText;
    NSString *validationText;
    
    BOOL validate = YES;
    
    if([type isEqual:@"Mail"]) {
        labelText = @"MAIL";
        placeholderText = @"mail@example.com";
        validationText = @"Please enter a valid mail address";
        
        if(self.tag==11) {
            validate = NO;
        }
    }
    
    else if([type isEqual:@"Password"]) {
        labelText = @"PASSWORD";
        placeholderText = @"Minimum 6 characters";
        validationText = @"Please enter a valid password";
        
        // Set password input
        self.input.inputText.secureTextEntry = YES;
    }
    
    else if([type isEqual:@"Username"]) {
        labelText = @"USERNAME";
        placeholderText = @"A nice username";
        validationText = @"Please enter a valid username";
        validate = NO;
    }
    
    // Set Labels and Placeholder Text
    self.input.inputText.placeholder = placeholderText;
    self.input.inputLabel.text = labelText;
    self.input.inputValidation.text = validationText;
    
    // Set If Input type validates or not
    self.doesValidate = validate;
}

@end
