//
//  ViewController.m
//  SafariViewControllerBugs
//
//  Created by Larry Cao on 4/25/16.
//
//

#import "ViewController.h"
#import "ContainerViewController.h"

@interface ViewController () 

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 * Dismissing a Safari View Controller in landscape via
 * swipe, from a presenting controller that only support
 * landscape orientation results in an unstable UI.
 */
- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

- (IBAction)presentSafariViewController:(id)sender {
    ContainerViewController *viewController = [[ContainerViewController alloc] init];
    [self presentViewController:viewController animated:NO completion:nil];

}

@end
