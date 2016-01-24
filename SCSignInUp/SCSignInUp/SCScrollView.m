//
//  SCScrollView.m
//  SCSignInUp
//
//  Created by Michael Evensen on 4/9/14.
//  Copyright (c) 2014 SoundCloud. All rights reserved.
//

#import "SCScrollView.h"

@implementation SCScrollView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)scrollToPoint:(CGPoint)scrollPoint {
    
    [UIView animateWithDuration:0.3 animations:^{
        self.contentOffset = scrollPoint;
    }];
    
    // Content Inset is set so that moving back to the view from other pushes keeps it in place.
    CGFloat _insetHeight = self.frame.size.height + scrollPoint.y;
    self.contentInset = UIEdgeInsetsMake(0, 0, _insetHeight, 0);
}

@end
