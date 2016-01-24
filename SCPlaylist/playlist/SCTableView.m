//
//  SCTableView.m
//  Playlist
//
//  Created by Michael Nino Evensen on 11/12/13.
//  Copyright (c) 2013 Michael Nino Evensen. All rights reserved.
//

#import "SCTableView.h"
#import "SCTrackCell.h"

@implementation SCTableView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        // init array
        self.trackImages = [NSMutableArray arrayWithObjects:
                            [UIImage imageNamed:@"artwork_image_1.png"],
                            [UIImage imageNamed:@"artwork_image_2.png"],
                            [UIImage imageNamed:@"artwork_image_3.png"],
                            [UIImage imageNamed:@"artwork_image_4.png"],
                            [UIImage imageNamed:@"artwork_image_5.png"],
                            [UIImage imageNamed:@"artwork_image_6.png"],
                            [UIImage imageNamed:@"artwork_image_7.png"],
                            nil];
        
    }
    return self;
}

//- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
//{
//    NSLog(@"Will begin dragging");
//}
//
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
//    CGFloat offset = scrollView.contentOffset.y;
//    
//    //    self.contentHeader.x = 0;
//    //    self.contentHeader = 0;
//    
//    // change y value of contentheader to always be 0
//    //    NSLog(@"%@", self.contentHeader);
//    
//}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // social
    if(section==0) {
        return 1;
    }
    
    // track cells
    else {
        
        // total tracks
        return [self.trackImages count];
    }
}

// set cell height
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && indexPath.row == 0) {
        return 63;
    }
    return 80;
}

// draw cells
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // social cell
    if(indexPath.section==0) {
        SCTrackCell *socialCell = (SCTrackCell *)[tableView dequeueReusableCellWithIdentifier:@"SCSocial"];
        
        return socialCell;
    }
    else {
        
        // track cell
        SCTrackCell *trackCell = (SCTrackCell *)[tableView dequeueReusableCellWithIdentifier:@"SCTrackCell"];
        
        // setup cell content
        trackCell.trackImage.image = self.trackImages[indexPath.row];
        trackCell.trackTitle.text = @"This is a track title";
        trackCell.trackUsername.text = @"Username";
        
        return trackCell;
    }
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
