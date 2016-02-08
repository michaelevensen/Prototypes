//
//  SCWelcomeViewController.m
//  SCWelcome
//
//  Created by Michael Evensen on 5/13/14.
//  Copyright (c) 2014 SoundCloud. All rights reserved.
//

#import "SCWelcomeViewController.h"

@interface SCWelcomeViewController ()

@end

@implementation SCWelcomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    // Set view controller count
    self.viewCount = 4;
    
    // Custom half point for bottom stroke
    [self.bottomStroke setFrame:CGRectMake(self.bottomStroke.frame.origin.x,
                                           self.bottomStroke.frame.origin.y,
                                           self.bottomStroke.frame.size.width,
                                           0.5)];
    
    // Create page view controller
    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
    self.pageViewController.dataSource = self;
      
    // Set up view controllers
    SCWelcomeDiscoverViewController *firstViewController = [self viewControllerAtIndex:0];
    
    NSArray *viewControllers = @[firstViewController];
    
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    // Change the size of page view controller
    self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-88);
    
    [self addChildViewController:self.pageViewController];
    [self.view addSubview:self.pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
}

#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{   
    NSUInteger index = [(id)viewController pageIndex];
   
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = [(id)viewController pageIndex];
    
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    
    if (index == self.viewCount) {
        return nil;
    }
    
    return [self viewControllerAtIndex:index];
}

- (id)viewControllerAtIndex:(NSUInteger)index
{
    
    if ((self.viewCount == 0) || (index >= self.viewCount)) {
        return nil;
    }
    
    id viewController;
    
    switch (index) {
        
        case 0:
           
            // Explore
            viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"DiscoverContentViewController"];
            
            break;
            
        case 1:
            
            // Search
            viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"SearchContentViewController"];
            
        break;
            
        case 2:
            
            // Profiles
            viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"FavoritesContentViewController"];
            
            break;
            
        case 3:
            
            // Player
            viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PlayerContentViewController"];
            
            break;
            
        default:
           
            return nil;
            
        break;
    }
    
    // Index
    [(id)viewController setPageIndex:index];
    
    return viewController;
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return self.viewCount;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}

@end
