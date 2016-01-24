//
//  SCInputself.m
//  SCInputFields
//
//  Created by Michael Evensen on 3/18/14.
//  Copyright (c) 2014 SoundCloud. All rights reserved.
//

#import "SCInput.h"

@implementation SCInput

- (void)awakeFromNib
{
    self.inputText.font = [UIFont fontWithName:@"Interstate-Light" size: self.inputText.font.pointSize];
}

- (IBAction)textInputBegan:(id)sender {

    // active orange label
    self.inputLabel.textColor = [UIColor colorWithRed:1 green:0.333 blue:0 alpha:1];
}

- (IBAction)textInputEnd:(id)sender {
    
    // inactive black label
    self.inputLabel.textColor = [UIColor blackColor];
}

@end
