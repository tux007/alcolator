//
//  BLCMainMenuViewController.m
//  Alcolator
//
//  Created by tom on 06/11/14.
//  Copyright (c) 2014 Bloc. All rights reserved.
//

#import "BLCMainMenuViewController.h"
#import "ViewController.h"
#import "BLCWhiskeyViewController.h"

@interface BLCMainMenuViewController ()

@property (weak, nonatomic) UIButton *wineButton;
@property (weak, nonatomic) UIButton *whiskeyButton;

@end

@implementation BLCMainMenuViewController

@synthesize wineButton, whiskeyButton;

- (void)loadView {
    // Allocate and initialize the all-encompassing view
    self.view = [[UIView alloc] init];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *superview = self.view;
    // Do any additional setup after loading the view.
    self.title = @"Select Alcolator";
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    /* Create wineButton and add to our view*/
    self.wineButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.wineButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.wineButton setTitle:@"Wine" forState:UIControlStateNormal];
    [self.view addSubview:self.wineButton];
    /* 2. Constraint to position wineButton's X*/
    NSLayoutConstraint *leftButtonXConstraint = [NSLayoutConstraint
                                                 constraintWithItem:self.wineButton attribute:NSLayoutAttributeCenterX
                                                 relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:superview attribute:
                                                 NSLayoutAttributeCenterX multiplier:1.0 constant:-60.0f];
    /* Constraint to position wineButton's Y*/
    NSLayoutConstraint *leftButtonYConstraint = [NSLayoutConstraint
                                                 constraintWithItem:self.wineButton attribute:NSLayoutAttributeCenterY
                                                 relatedBy:NSLayoutRelationEqual toItem:superview attribute:
                                                 NSLayoutAttributeCenterY multiplier:1.0f constant:0.0f];
    /* Add the constraints to button's superview*/
    [superview addConstraints:@[ leftButtonXConstraint,
                                 leftButtonYConstraint]];
    
    [self.wineButton addTarget:self action:@selector(winePressed:) forControlEvents:UIControlEventTouchUpInside];
    
    /* Create whiskeyButton and add to our view*/
    self.whiskeyButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.whiskeyButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.whiskeyButton setTitle:@"Whiskey" forState:UIControlStateNormal];
    [self.view addSubview:self.whiskeyButton];
    /* Constraint to position whiskeyButton X*/
    NSLayoutConstraint *rightButtonXConstraint = [NSLayoutConstraint
                                                  constraintWithItem:self.whiskeyButton attribute:NSLayoutAttributeCenterX
                                                  relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:superview attribute:
                                                  NSLayoutAttributeCenterX multiplier:1.0 constant:60.0f];
    /* Constraint to position whiskeyButton Y*/
    rightButtonXConstraint.priority = UILayoutPriorityDefaultHigh;
    NSLayoutConstraint *centerYMyConstraint = [NSLayoutConstraint 
                                               constraintWithItem:self.whiskeyButton attribute:NSLayoutAttributeCenterY
                                               relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:superview attribute:
                                               NSLayoutAttributeCenterY multiplier:1.0f constant:0.0f];
    [superview addConstraints:@[centerYMyConstraint, rightButtonXConstraint]];
    
    [self.whiskeyButton addTarget:self action:@selector(whiskeyPressed:) forControlEvents:UIControlEventTouchUpInside];

    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void) winePressed:(UIButton *) sender {
    ViewController *wineVC = [[ViewController alloc] init];
    [self.navigationController pushViewController:wineVC animated:YES];
}

- (void) whiskeyPressed:(UIButton *) sender {
    BLCWhiskeyViewController *whiskeyVC = [[BLCWhiskeyViewController alloc] init];
    [self.navigationController pushViewController:whiskeyVC animated:YES];
}

@end
