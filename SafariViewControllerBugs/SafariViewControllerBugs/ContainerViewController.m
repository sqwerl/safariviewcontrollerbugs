//
//  ContainerViewController.m
//  SafariViewControllerBugs
//
//  Created by Larry Cao on 4/25/16.
//
//

#import "ContainerViewController.h"

@import SafariServices.SFSafariViewController;

@interface ContainerViewController () <SFSafariViewControllerDelegate>

@property (nonatomic) SFSafariViewController *safariViewController;

@end

@implementation ContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _safariViewController = [[SFSafariViewController alloc] initWithURL:[NSURL URLWithString:@"https://www.twitter.com"]];
    _safariViewController.delegate = self;

    [self addChildViewController:_safariViewController];
    _safariViewController.view.frame = self.view.bounds;
    _safariViewController.view.autoresizingMask = (UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth);
    [self.view addSubview:_safariViewController.view];
    [_safariViewController didMoveToParentViewController:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (id<UIViewControllerTransitioningDelegate>)transitioningDelegate
{
    return _safariViewController.transitioningDelegate;
}

#pragma mark - SFSafariViewControllerDelegate

/**
 * This method does not get called when the Safari
 * View Controller's delegate (in this case, the
 * ContainerViewController) is deallocated before the
 * interactive dismiss (swipe to dismiss) transition
 * finishes.
 */
- (void)safariViewControllerDidFinish:(SFSafariViewController *)controller
{
    NSLog(@"safariViewControllerDidFinish:%@", controller);
}


@end
