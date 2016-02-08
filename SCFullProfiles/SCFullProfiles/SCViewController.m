//
//  SCViewController.m
//  SCFullProfiles
//
//  Created by Michael Evensen on 3/24/14.
//  Copyright (c) 2014 SoundCloud. All rights reserved.
//

#import "SCViewController.h"
#import "UIImage+ImageEffects.h"

CGFloat infoTransitionValue;

@interface SCViewController ()

@end

@implementation SCViewController

- (void)viewDidLoad
{
    /*
     * Set initials
     */
    self.coverHeight = self.cover.frame.size.height;
    
    // for info animation movement
    infoTransitionValue = 20.0;
    
    /*
     * Create and Add Blur Artwork
     */
    self.coverBlur = [[UIImageView alloc] initWithImage:[self.coverImage.image applyDarkEffect]];
    [self.cover addSubview:self.coverBlur];
    self.coverBlur.frame = self.coverImage.frame;
    self.coverBlur.contentMode = UIViewContentModeScaleAspectFill;
    
    self.coverBlur.alpha = 0;
    
    [super viewDidLoad];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat offset = scrollView.contentOffset.y;
    
    // Fade Out Blurred artwork based on offset
    CGFloat offsetDestination = ( self.cover.frame.size.height / 2 ); // end destination for offset
    CGFloat infoBlur = MIN(1, MAX(0, ( (offsetDestination - offset) / offsetDestination) ) ); // for values from 1 to 0
    
    // fade info if visible
    if(scrollView.contentOffset.y>self.cover.frame.size.height) {
        
        if(self.coverInfo.alpha>0) {
            self.coverInfo.alpha = infoBlur;
            self.coverBlur.alpha = infoBlur;
            
            // reset y position view
            self.coverInfo.center = CGPointMake(self.coverInfo.center.x, self.coverInfo.center.y+infoTransitionValue);
        }
    }
    
    if(offset<0) {
    
        /*
         * Resize artwork (Scale up on pull down)
         */
        self.cover.frame = CGRectMake(self.cover.frame.origin.x,
                                      offset,
                                      self.cover.frame.size.width,
                                      self.coverHeight-offset+1);
    }
}

- (IBAction)close:(id)sender {
    
    [UIView animateWithDuration:0.35 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.coverBlur.alpha = 0;
        self.coverInfo.alpha = 0;
        
        self.coverInfo.center = CGPointMake(self.coverInfo.center.x, self.coverInfo.center.y+infoTransitionValue);
        
    } completion:nil];
}

- (IBAction)more:(id)sender {
    
    [UIView animateWithDuration:0.35 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.coverBlur.alpha = 1;
        self.coverInfo.alpha = 1;
        
        // moving animation for info view
        self.coverInfo.center = CGPointMake(self.coverInfo.center.x, self.coverInfo.center.y-infoTransitionValue);

    } completion:nil];
}
@end
