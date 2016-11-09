//
//  ViewController.m
//  AutoLayoutStory
//
//  Created by Tim Beals on 2016-11-08.
//  Copyright © 2016 Tim Beals. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIView *yellowBox;
@property (nonatomic, strong) IBOutlet UIView *greenView;

@property (nonatomic, weak) NSLayoutConstraint *yellowBoxHeight;
@property (nonatomic, weak) NSLayoutConstraint *greenViewBottMargin;
@property (nonatomic) BOOL isTabUp;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.isTabUp = NO;
    self.yellowBox = [[UIView alloc] initWithFrame:CGRectZero];
    self.yellowBox.translatesAutoresizingMaskIntoConstraints = NO;
    self.yellowBox.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.yellowBox];
    
    NSLayoutConstraint *yellowBoxRMargin = [NSLayoutConstraint constraintWithItem:self.yellowBox
                                                                        attribute:NSLayoutAttributeRight
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:self.view
                                                                        attribute:NSLayoutAttributeRight
                                                                       multiplier:1
                                                                         constant:0];
    
    NSLayoutConstraint *yellowBoxLMargin = [NSLayoutConstraint constraintWithItem:self.yellowBox
                                                                        attribute:NSLayoutAttributeLeft
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:self.view
                                                                        attribute:NSLayoutAttributeLeft
                                                                       multiplier:1
                                                                         constant:0];
    
    NSLayoutConstraint *yellowBoxBottMargin = [NSLayoutConstraint constraintWithItem:self.yellowBox
                                                                           attribute:NSLayoutAttributeBottomMargin
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:self.view
                                                                           attribute:NSLayoutAttributeBottomMargin
                                                                          multiplier:1
                                                                            constant:0];
    
    self.yellowBoxHeight = [NSLayoutConstraint constraintWithItem:self.yellowBox
                                                                       attribute:NSLayoutAttributeHeight
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:nil
                                                                       attribute:NSLayoutAttributeNotAnAttribute
                                                                      multiplier:1
                                                                        constant:0];
    
    [self.view addConstraint:yellowBoxRMargin];
    [self.view addConstraint:yellowBoxLMargin];
    [self.view addConstraint:yellowBoxBottMargin];
    [self.view addConstraint:self.yellowBoxHeight];
    
    self.greenViewBottMargin = [NSLayoutConstraint constraintWithItem:self.greenView
                                                            attribute:NSLayoutAttributeBottomMargin
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self.view
                                                            attribute:NSLayoutAttributeBottomMargin
                                                           multiplier:1
                                                             constant:0];
    
    [self.view addConstraint:self.greenViewBottMargin];
}

- (IBAction)blueButtonPushed:(id)sender
{
    if(self.isTabUp == NO)
    {
        float greenBottom = -150.00;
        float yellowHeight = 150.00;
        [UIView animateWithDuration:2.0 animations:^(){
            self.yellowBoxHeight.constant = yellowHeight;
            self.greenViewBottMargin.constant = greenBottom;
            [self.view layoutIfNeeded];
        }];
        self.isTabUp = YES;
    }
    else if(self.isTabUp == YES)
    {
        [self.view addConstraint:self.greenViewBottMargin];
        
        float greenBottom = 00.00;
        float yellowHeight = 00.00;
        [UIView animateWithDuration:2.0 animations:^(){
            self.yellowBoxHeight.constant = yellowHeight;
            self.greenViewBottMargin.constant = greenBottom;
            [self.view layoutIfNeeded];
        }];
        self.isTabUp = NO;
    }
    [self.view layoutIfNeeded];
}

@end
