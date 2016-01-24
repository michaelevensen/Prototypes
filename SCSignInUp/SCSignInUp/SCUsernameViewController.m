//
//  SCUsernameViewController.m
//  SCSignInUp
//
//  Created by Michael Evensen on 4/5/14.
//  Copyright (c) 2014 SoundCloud. All rights reserved.
//

#import "SCUsernameViewController.h"
#import "SCViewController.h"

UIBarButtonItem *doneButton;

@interface SCUsernameViewController ()

@end

@implementation SCUsernameViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)textFieldDidChange:(UITextField *)sender {
    
    id buttonItem;
    
    /*
     * Show "Done" when Text Field contains text
     */
    if(sender.text.length>0) {
        buttonItem = doneButton;
    } else if(self.navigationItem.rightBarButtonItem) {
        
        buttonItem = nil;
    }
    
    self.navigationItem.rightBarButtonItem = buttonItem;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // "Skip" button
    doneButton = self.navigationItem.rightBarButtonItem;
    self.navigationItem.rightBarButtonItem = nil;
    
    // Add listeners for Text Input
    [self.usernameInput.input.inputText addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];

    // hide back button
    self.navigationItem.hidesBackButton = YES;
    
    // First responder
    [self.usernameInput.input.inputText becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dismissUsername {
    
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Cancel and Done

- (IBAction)onCancel:(id)sender {

    [self dismissUsername];
}

- (IBAction)onDone:(id)sender {
    
    // for loading state
    [self.view endEditing:YES];
    
    // show spinner
    [self.usernameInput showSpinner:YES];
    
    // If there is an error
    [self performSelector:@selector(errorView) withObject:nil afterDelay:1.0];
}

- (void)errorView {
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Username already taken" message:@"Please choose another username" delegate:self cancelButtonTitle:@"Continue" otherButtonTitles:nil, nil];
    
    [alertView show];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    
    if(buttonIndex==0) {
        
        [self.usernameInput.input.inputText becomeFirstResponder];
        [self.usernameInput showSpinner:NO];
    }
}


@end
