//
//  SCWelcomeSearchFollowButton.m
//  SCWelcome
//
//  Created by Michael Evensen on 5/27/14.
//  Copyright (c) 2014 SoundCloud. All rights reserved.
//

#import "SCWelcomeSearchFollowButton.h"

@implementation SCWelcomeSearchFollowButton

// Init with Custom XIB
- (id)initWithCoder:(NSCoder *)aDecoder {
    
    if ((self = [super initWithCoder:aDecoder])){
        
        NSLog(@"init");
        
        // Setup XIB
        self.followButton = [[[NSBundle mainBundle] loadNibNamed:@"SCFollowButton" owner:self options:nil] objectAtIndex:0];
        
        // Add to View
        [self addSubview:self.followButton];
    }
    
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
