//
//  SCTrackCell.h
//  Playlist
//
//  Created by Michael Nino Evensen on 11/12/13.
//  Copyright (c) 2013 Michael Nino Evensen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SCTrackCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *trackTitle;
@property (weak, nonatomic) IBOutlet UILabel *trackUsername;
@property (weak, nonatomic) IBOutlet UIImageView *trackImage;


@property (weak, nonatomic) IBOutlet UILabel *socialTitle;
@property (weak, nonatomic) IBOutlet UIImageView *socialImage;

@end
