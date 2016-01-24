//
//  SCViewController.h
//  SCFullProfiles
//
//  Created by Michael Evensen on 3/24/14.
//  Copyright (c) 2014 SoundCloud. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCLabel.h"

@interface SCViewController : UIViewController<UIScrollViewDelegate>

- (IBAction)more:(id)sender;

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

// Cover
@property (strong, nonatomic) IBOutlet UIView *cover;
@property (strong, nonatomic) IBOutlet UIImageView *coverImage;
@property (strong, nonatomic) IBOutlet UIImageView *coverBlur;
@property (nonatomic) CGFloat coverHeight;

@property (strong, nonatomic) IBOutlet UIView *coverInfo;

@end
