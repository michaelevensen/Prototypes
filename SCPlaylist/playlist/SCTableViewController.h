//
//  SCTableViewController.h
//  Playlist
//
//  Created by Michael Nino Evensen on 11/12/13.
//  Copyright (c) 2013 Michael Nino Evensen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCButton.h"
#import "SCLabel.h"

@interface SCTableViewController : UITableViewController

/*
 * Static Data
 */
@property NSMutableArray *playCounts;

@property (nonatomic) NSMutableArray *trackImages;
@property (nonatomic) NSMutableDictionary *trackInfo;
@property NSArray *trackTitles;
@property NSArray *trackCreators;

// header view
@property (weak, nonatomic) IBOutlet UIView *headerView;

// header
@property (weak, nonatomic) IBOutlet UIView *header;
@property (weak, nonatomic) IBOutlet UIImageView *headerArtwork;
@property (weak, nonatomic) IBOutlet UIView *headerTitles;
@property (nonatomic) CGFloat headerSize;
@property (weak, nonatomic) IBOutlet UIView *headerOverlay;

@property (weak, nonatomic) IBOutlet UIView *social; // social

// header labels
@property (weak, nonatomic) IBOutlet UIView *headerLabels;
@property (weak, nonatomic) IBOutlet UILabel *headerLabel;
@property (weak, nonatomic) IBOutlet UILabel *headerTrackCount;

// assets
@property (weak, nonatomic) IBOutlet UIView *headerAssets;
@property (weak, nonatomic) IBOutlet UIImageView *playButtonAsset;

// image height
@property (nonatomic) CGFloat frameHeight;
@property (nonatomic) UIImage *blurredImage;
@property (weak, nonatomic) IBOutlet UIImageView *blurredImageView;

// titles
@property (weak, nonatomic) IBOutlet UIView *playlistTitleView;
@property (weak, nonatomic) IBOutlet UIView *playlistCreatorView;
@property (weak, nonatomic) IBOutlet UILabel *playlistTitle;
@property (weak, nonatomic) IBOutlet UILabel *playListCreator;

// fake footer
@property (weak, nonatomic) IBOutlet UIImageView *footer;


// buttons
@property (weak, nonatomic) IBOutlet SCButton *shareBtn;
@property (weak, nonatomic) IBOutlet SCButton *likeBtn;
@property (weak, nonatomic) IBOutlet SCButton *repostBtn;
@property (weak, nonatomic) IBOutlet SCButton *moreBtn;

@property (weak, nonatomic) IBOutlet SCLabel *totalTracksLabel;

- (IBAction)moreTouch:(id)sender;

@end
