//
//  SCTextView.m
//  SCSignInUp
//
//  Created by Michael Evensen on 4/3/14.
//  Copyright (c) 2014 SoundCloud. All rights reserved.
//

#import "SCTextView.h"

@implementation SCTextView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Set font
    self.font = [UIFont fontWithName:@"Interstate-Light" size: self.font.pointSize];
}


@end
