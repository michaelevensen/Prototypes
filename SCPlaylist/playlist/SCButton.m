//
//  SCButton.m
//  Playlist
//
//  Created by Michael Nino Evensen on 10/12/13.
//  Copyright (c) 2013 Michael Nino Evensen. All rights reserved.
//

#import "SCButton.h"
#import <QuartzCore/QuartzCore.h>
#import "SCLabel.h"

@implementation SCButton

-(void)awakeFromNib {
    
    [super awakeFromNib];
    
    // Button
    [self.layer setCornerRadius: 3.0f];
    [self.layer setMasksToBounds: YES];
    
    // Font
    self.titleLabel.font = [UIFont fontWithName:@"Interstate-Light" size: self.titleLabel.font.pointSize];
    
    // Border
    [self.layer setBorderWidth: 1.0f];
    UIColor *borderColor = [UIColor colorWithRed:229/255.0f green:229/255.0f blue:229/255.0f alpha:1.0f];
    self.layer.borderColor = [borderColor CGColor];
    
    // Background
//    UIColor *bgColor = [UIColor colorWithRed:250/255.0f green:250/255.0f blue:250/255.0f alpha:1.0f];
//    self.layer.backgroundColor = [bgColor CGColor];
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
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
