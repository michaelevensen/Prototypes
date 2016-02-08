//
//  SCLabel.m
//  Playlist
//
//  Created by Michael Nino Evensen on 10/12/13.
//  Copyright (c) 2013 Michael Nino Evensen. All rights reserved.
//

#import "SCLabel.h"

@implementation SCLabel

-(void)awakeFromNib {
    
    [super awakeFromNib];
    
    // default font style (based on set font size)
    self.font = [UIFont fontWithName:@"Interstate-Light" size: self.font.pointSize];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Init
    }
    return self;
}

@end
