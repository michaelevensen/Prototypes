//
//  SCButton.m
//  SCInputFields
//
//  Created by Michael Evensen on 3/20/14.
//  Copyright (c) 2014 SoundCloud. All rights reserved.
//

#import "SCButton.h"

@implementation SCButton

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
    // Drawing code
    self.titleLabel.font = [UIFont fontWithName:@"Interstate-Light" size: self.titleLabel.font.pointSize];
}

@end
