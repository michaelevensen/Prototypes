//
//  SCPlayerEngagementButton.m
//  SCPlayer
//
//  Created by Michael Evensen on 4/30/14.
//  Copyright (c) 2014 SoundCloud. All rights reserved.
//

#import "SCPlayerEngagementButton.h"

@implementation SCPlayerEngagementButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    self.titleLabel.font = [UIFont fontWithName:@"Interstate-Light" size: self.titleLabel.font.pointSize];
}

@end
