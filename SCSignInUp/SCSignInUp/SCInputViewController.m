//
//  SCInputViewController.m
//  SCSignInUp
//
//  Created by Michael Evensen on 4/2/14.
//  Copyright (c) 2014 SoundCloud. All rights reserved.
//

#import "SCInputViewController.h"
#import "SCUsernameViewController.h"

UIBarButtonItem *doneButton;

@interface SCInputViewController ()

@end

@implementation SCInputViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark - Set form type

- (void)setFormTypeTo:(NSString *)type {
    
    NSString *navTitle;
    NSString *placeholderTextMail;
    NSString *placeholderTextPassword;
    
    if([type isEqualToString:@"Create"]) {
        
        // Set title appropriately
        navTitle = @"Create account";
        
        // Placeholder text for mail
        placeholderTextMail = @"mail@example.com";
        
        // Placeholder text for password
        placeholderTextPassword = @"Minimum 6 characters";
        
        // Social
        self.labelFacebook.text = @"Sign up with Facebook";
        self.labelGoogle.text = @"Sign up with Google+";
    }
    else if([type isEqualToString:@"Sign"]){
        
        // Navigation Bar title
        navTitle = @"Sign in";
        
        // Placeholder text for mail
        placeholderTextMail = @"Your email";
        
        // Placeholder text for password
        placeholderTextPassword = @"Your password";
        
        // Does not validate
        self.mailAddressInput.doesValidate = NO;
        self.passwordInput.doesValidate = NO;
        
        // Social
        self.labelFacebook.text = @"Sign in with Facebook";
        self.labelGoogle.text = @"Sign in with Google+";
        
        // Set sign in TOS
        self.tosText.alpha = 0;
        self.signinText.alpha = 1;
    }
    
    // Set title appropriately
    self.navigationItem.title = navTitle;
    
    // Set placeholder text for mail
    self.mailAddressInput.input.inputText.placeholder = placeholderTextMail;
    
    // Set placeholder text for password
    self.passwordInput.input.inputText.placeholder = placeholderTextPassword;
}

#pragma mark - View did Load

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Keyboard Notification
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
    
    // set form type
    [self setFormTypeTo:self.formType];
    
    // Done button
    doneButton = self.navigationItem.rightBarButtonItem;
    self.navigationItem.rightBarButtonItem = nil;
    
    // Add listeners for Text Input
    [self.passwordInput.input.inputText addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self.mailAddressInput.input.inputText addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
}

- (void)textFieldDidChange:(UITextField *)sender {
    
    if([self.formType isEqualToString:@"Create"]) {
        
        /*
         * Show "Done" when both Text Fields validates
         */
        if(self.passwordInput.validated && self.mailAddressInput.validated) {
            self.navigationItem.rightBarButtonItem = doneButton;
        } else {
            self.navigationItem.rightBarButtonItem = nil;
        }
    } else {
        
        /*
         * Show "Done" when both Text Fields contains text
         */
        
        if(self.passwordInput.input.inputText.text.length>0 && self.mailAddressInput.input.inputText.text.length>0) {
            self.navigationItem.rightBarButtonItem = doneButton;
        } else {
            self.navigationItem.rightBarButtonItem = nil;
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Forgot Password

- (IBAction)onForgotPassword:(id)sender {

    // end editing
    [self.view endEditing:YES];

    // Show spinner
    [self.mailAddressInput showSpinner:YES];
    
    // Show Forgot password
    [self performSelector:@selector(errorView) withObject:nil afterDelay:2.0];

}

#pragma mark - Alert view

- (void)errorView {
    
    UIAlertView *alertView = [[UIAlertView alloc] init];
    alertView.delegate = self;
    
    if(self.mailAddressInput.input.inputText.text.length>5)
    {
        alertView.title = @"We've just sent you an email";
        alertView.message = @"Check your email for instructions.";
        [alertView addButtonWithTitle:@"Continue"];
    }
    else
    {
        alertView.title = @"Wrong email";
        alertView.message = @"Please check your mail input.";
        [alertView addButtonWithTitle:@"Continue"];
    }
    
    // Hide spinner
    [self.mailAddressInput showSpinner:NO];
    
    [alertView show];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    
    if(buttonIndex==0) {
        
        if(self.mailAddressInput.input.inputText.text.length>5)
        {
            [self.passwordInput setFocus:YES];
        }
        else
        {
            [self.mailAddressInput setFocus:YES];
        }
    }
}

#pragma mark - Cancel and Done

- (IBAction)onCancel:(id)sender {
    
     [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)onDone:(id)sender {

    // end editing
    [self.view endEditing:YES];
    
    // Show spinner
    [self.mailAddressInput showSpinner:YES];
    
    if([self.formType isEqualToString:@"Create"]) {

        // Go to Choose usesrname
        [self performSelector:@selector(showChooseUsername) withObject:nil afterDelay:2.0];
    } else {
        
        // End Sign in
        [self performSelector:@selector(endSignin) withObject:nil afterDelay:2.0];
    }
}

#pragma mark - End Sign in

- (void)endSignin {
    
    // Finish
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Choose Username Presentation

- (void)showChooseUsername {
 
    // Show "Choose Username" while maintaining Navigation Controller
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SCUsernameViewController *chooseUsername = (SCUsernameViewController*)[storyboard instantiateViewControllerWithIdentifier:@"chooseUsername"];

    // push "choose username" on to stack
    [self.navigationController pushViewController:chooseUsername animated:YES];
}

#pragma mark - Mail Sign up

- (void)mailSignUp:(BOOL)state {
    
    // Only show "Forgot password" for "Sign in"
    if([self.formType isEqualToString:@"Sign"]) {
    
        [UIView animateWithDuration:0.3 animations:^{
            self.signinText.alpha = 0;
            self.forgotPassword.alpha = 1;
        }];
    }
    
    // Scroll to Point
    [self.scrollView scrollToPoint:CGPointMake(0, (state ? 180.0 : 0))];
    
    // Set Scrolling
    self.scrollView.scrollEnabled = (state ? NO : YES);
    
    // close keyboard
    if(!state) [self.view endEditing:YES];
}

#pragma mark - Keyboard Logic

- (void)keyboardWasShown:(NSNotification *)notification
{
    [self mailSignUp:YES];
}

-(void)keyboardWillBeHidden:(NSNotification *)notification
{
    //
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    // resign responder
    [self.view resignFirstResponder];
}

@end
