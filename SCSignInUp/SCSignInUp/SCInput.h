//
//  SCInputCell.h
//  SCInputFields
//
//  Created by Michael Evensen on 3/18/14.
//  Copyright (c) 2014 SoundCloud. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCLabel.h"

@interface SCInput : UIView

@property (strong, nonatomic) IBOutlet SCLabel *inputLabel;
@property (strong, nonatomic) IBOutlet SCLabel *inputValidation;
@property (strong, nonatomic) IBOutlet UITextField *inputText;
@property (strong, nonatomic) IBOutlet UIImageView *inputCheckmark;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *inputIndicator;

@end