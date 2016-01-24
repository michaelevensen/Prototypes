//
//  SCTableViewController.m
//  Playlist
//
//  Created by Michael Nino Evensen on 11/12/13.
//  Copyright (c) 2013 Michael Nino Evensen. All rights reserved.
//

#import "SCTableViewController.h"
#import "SCTrackCell.h"
#import "UIImage+ImageEffects.h"
#import <stdlib.h>

@interface SCTableViewController ()

@end

@implementation SCTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    /*
     * Set initials
     */
    self.frameHeight = self.header.frame.size.height;
    
    UITableView *tablev = [self tableView];
    tablev.contentInset = UIEdgeInsetsMake(0.0, 0.0, 50.0, 0.0);
    
    
    // header size
    self.headerSize = 62;
    
    // position fake footer
    CGRect footerFrame = self.footer.frame;
    footerFrame.origin.y = 516;
    self.footer.frame = footerFrame;
    

    
     // track images 120x120
    self.trackImages = [[NSMutableArray alloc] init];
    
    // track playcount
    self.playCounts = [[NSMutableArray alloc] init];
    
    for(int i = 1; i<14; ++i)
    {
        [self.trackImages addObject:[UIImage imageNamed:[NSString stringWithFormat:@"artwork_%d.png", i]]];
        
        // make random play counts (yes i know this is stupid, we should make a static class that contains all this)
        NSUInteger randomPlayCount = arc4random_uniform(312456);
        [self.playCounts addObject:[NSString stringWithFormat:@"%d", randomPlayCount]];
    }
    
    // static track info
    self.trackInfo = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                      @"Dude (feat. Curren$y) [Prod. Blended Babies]", @"ghostly",
                      @"Greg's Mellow Trip", @"Mario Basanov",
                      @"Metronomy - I'm Aquarius", @"i-D Online",
                      @"Emufucka & Trancemicsoul - Tokyoria", @"Mixmag",
                      @"John Tejada - We Can Pretend", @"BOILER ROOM",
                      @"Sebastien Bouchet - Speicher 77", @"leeholman",
                      @"'Home Of The Puffin' Radiomix", @"chavezminerva",
                      @"Jungle - Platoon", @"mariaminerva",
                      @"Enero 2014", @"CannibalRadio",
                      @"Moullinex - Flora", @"Skeewiff",
                      @"The Field - Cupid's Head (Sonns Mix)", @"Fremtiden",
                      @"Duonome", @"liarsliarsliars",
                      @"Agents of Time - Lost Dreams EP", @"plunk!",
                      @"i-DJ: Mario Basanov", @"LIFE AND DEATH",
                      nil];
    
    self.trackCreators = [self.trackInfo allKeys];
    self.trackTitles = [self.trackInfo allValues];
}

-(void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    /*
     * Add Blur Version of Image
     */
    UIColor *tintColor = [UIColor colorWithRed:0.0f/255.0f green:0.0f/255.0f blue:0.0f/255.0f alpha:0.35f];
    
    self.blurredImage = [self.headerArtwork.image applyBlurWithRadius:25.0 tintColor:tintColor saturationDeltaFactor:1.0 maskImage:self.headerArtwork.image];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:self.blurredImage];
    imageView.frame = CGRectMake(0,0,self.headerArtwork.frame.size.width, self.headerArtwork.frame.size.height);
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    self.blurredImageView.alpha = 0;
    [self.blurredImageView addSubview:imageView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // header and offset
    CGFloat offset = scrollView.contentOffset.y;
    CGRect headerFrame = self.header.frame;
    // social
    CGRect socialFrame = self.social.frame;
    
    // assets - play and back
    CGRect assetsFrame = self.headerAssets.frame;

    /*
     * Play Asset
     */
    CGFloat playFadeValue = MAX(0, MIN(1, (offset - 0) / ((self.frameHeight/4) - 0)));
    self.playButtonAsset.alpha = 1-playFadeValue;

    // fade out large artist and track titles
    CGFloat blur_start = self.frameHeight/2.2;
    CGFloat blur_end = self.frameHeight/6;
    
    CGFloat titleFadeValue = MAX(0, MIN(1, ((offset - blur_start) - 0) / (blur_end - 0)));
    self.headerTitles.alpha = 1-titleFadeValue;
    
    /*
     * Blurred Image
     */
    CGFloat header_distance = 150.0f;
    CGFloat imageBlurFadeValue = MAX(0, MIN(1, (offset - header_distance) / ((self.frameHeight-self.headerSize) - header_distance)));
    self.blurredImageView.alpha = imageBlurFadeValue;
    
    // Fade in Header Labels
    CGRect headerLabelFrame = self.headerLabels.frame;
    headerLabelFrame.origin.y = offset;
    self.headerLabels.frame = headerLabelFrame;
    self.headerLabels.alpha = imageBlurFadeValue;
    
    // offset positive
    if(offset>0) {
       
        /*
         * Header
         */
        if(offset>(self.frameHeight-self.headerSize)) {
            
            // Header
            headerFrame.origin.y = (offset-self.header.frame.size.height+self.headerSize);
            self.header.frame = headerFrame;
            
            // on engagements
//            if(offset<(self.frameHeight-self.headerSize+self.social.frame.size.height) )
//            {
//                NSLog(@"on engagement bar");
//            }
//            
            // Social
//            socialFrame.origin.y = offset+self.headerSize;
//            self.social.frame = socialFrame;
        }
        else if(offset<(self.frameHeight-self.headerSize) && headerFrame.origin.y>0)
        {
            // reset frame to 0 on fast scrolls
            headerFrame.origin.y = 0;
            self.header.frame = headerFrame;
            
            socialFrame.origin.y = 405;
            self.social.frame = socialFrame;
        }
    }
    // offset reverse
    else {
        
        // headerframe stay in place
        headerFrame.origin.y = 0;
        self.header.frame = headerFrame;
        
        /*
        * Resize artwork (Scale up)
        */
        self.headerArtwork.frame = CGRectMake(self.header.frame.origin.x, offset, self.header.frame.size.width, self.frameHeight-offset);
    }
    
    // don't move back and play
    assetsFrame.origin.y = offset;
    self.headerAssets.frame = assetsFrame;
}

-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    CGRect socialFrame = self.social.frame;
    
    socialFrame.origin.y = 405;
    self.social.frame = socialFrame;
    
    CGFloat h = (self.frameHeight-self.headerSize+self.social.frame.size.height);

    if(targetContentOffset->y>(self.frameHeight-self.headerSize)) {
        
        if(targetContentOffset->y<(h-(socialFrame.size.height/2))) {
            targetContentOffset->y = h-socialFrame.size.height;
        }
        else if(targetContentOffset->y<(h+(socialFrame.size.height/2))) {
            targetContentOffset->y = h;
        }
        
    }
}

//-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
//    
//    CGFloat bottom_max = 140.0f;
//    CGFloat velocity_min = 0.20f;
//    
//    if(targetContentOffset->y>bottom_max && velocity.y<=velocity_min) {
//        NSLog(@"max");
//        scrollView.decelerationRate = UIScrollViewDecelerationRateFast;
//    }
//    else {
//        NSLog(@"normal");
//       scrollView.decelerationRate = UIScrollViewDecelerationRateNormal;
//    }
//    
//    
//    NSLog(@"%f", velocity.y);
//    
//    if(targetContentOffset->y<self.frameHeight/2) {
//        targetContentOffset->y = 0;
//    
//    } else if(targetContentOffset->y<self.frameHeight) {
//        
//        targetContentOffset->y = self.frameHeight-self.headerSize;
//    }
//}

//-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
//    
//    
//    // lock to top and bottom
//    if(scrollView.contentOffset.y<self.frameHeight/2) {
//        
//        [self.tableView scrollRectToVisible: CGRectMake(0, 0, 1, 1) animated:YES];
//        
//    } else {
//        
//        CGFloat topHalf = (scrollView.contentOffset.y-self.header.frame.size.height+self.headerSize);
////        [self.tableView setContentOffset:<#(CGPoint)#> animated:<#(BOOL)#>];
//        [self.tableView scrollRectToVisible: CGRectMake(0,scrollView.contentOffset.y+100, 1, 1) animated:YES];
//    }
//}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // set cell height
    return 102;
}

#pragma mark - Currency formatting
- (NSString *)convertToCommaSeparated:(NSString *)inputAmount{
    NSDecimalNumber *someAmount = [NSDecimalNumber decimalNumberWithString:inputAmount];
    NSNumberFormatter *currencyFormatter = [[NSNumberFormatter alloc] init];
    [currencyFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    [currencyFormatter setCurrencySymbol:@""];
    [currencyFormatter setMaximumFractionDigits:0];
    [currencyFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];

    return [currencyFormatter stringFromNumber:someAmount];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.trackImages count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SCTrackCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SCTrackCell" forIndexPath:indexPath];
        
    if(indexPath.row == 4 || indexPath.row == 1 || indexPath.row == 7 || indexPath.row == 11) {
        cell.socialTitle.text = [NSString stringWithFormat:@"Reposted by %@", self.trackCreators[indexPath.row]];
        cell.socialImage.image = [UIImage imageNamed: @"reposted.png"];
        [cell.socialTitle setFrame:CGRectMake(128, cell.socialTitle.frame.origin.y, cell.socialTitle.frame.size.width, cell.socialTitle.frame.size.height)];
    }
    else {
        // format playcount
        NSString *num = [self convertToCommaSeparated:self.playCounts[indexPath.row]];
        
        cell.socialTitle.text = num;
        cell.socialImage.image = [UIImage imageNamed: @"small_play.png"];
        
        [cell.socialTitle setFrame:CGRectMake(119, cell.socialTitle.frame.origin.y, cell.socialTitle.frame.size.width, cell.socialTitle.frame.size.height)];
    }
    
    cell.trackImage.image = self.trackImages[indexPath.row];
    cell.trackTitle.text = self.trackTitles[indexPath.row];
    cell.trackUsername.text = self.trackCreators[indexPath.row];
    
    return cell;
}

- (IBAction)moreTouch:(id)sender {
    
    // like
    self.shareBtn.hidden = NO;
    self.repostBtn.hidden = NO;

    // animate like
    [UIView transitionWithView:self.likeBtn
                      duration:0.25f

                       options:UIViewAnimationOptionCurveEaseInOut
                    animations:^(void) {
                        self.likeBtn.center = CGPointMake(52,self.likeBtn.center.y);
                        self.moreBtn.alpha = 0.0f;
                        self.totalTracksLabel.alpha = 0.0f;
                        self.shareBtn.alpha = 1.0f;
                        self.repostBtn.alpha = 1.0f;
                    }
                    completion:^(BOOL finished) {
                        [self performSelector:@selector(animateBack) withObject:nil afterDelay:(3.0f)];
                    }];
}
-(void)animateBack {
    [UIView transitionWithView:self.likeBtn
                      duration:0.25f
                       options:UIViewAnimationOptionCurveEaseInOut
                    animations:^(void) {
                        self.likeBtn.center = CGPointMake(171+self.likeBtn.frame.size.width/2,self.likeBtn.center.y);
                        self.moreBtn.alpha = 1.0f;
                        self.totalTracksLabel.alpha = 1.0f;
                        self.shareBtn.alpha = 0.0f;
                        self.repostBtn.alpha = 0.0f;
                    }
                    completion:^(BOOL finished) {
                       //
                    }];
}

@end
