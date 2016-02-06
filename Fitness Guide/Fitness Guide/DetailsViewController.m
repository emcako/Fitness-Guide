//
//  DetailsViewController.m
//  Fitness Guide
//
//  Created by emcako on 04/02/2016.
//  Copyright © 2016 emcako. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Details";
    self.muscleLabel.text = self.exercise.mainMuscle;
    self.exerciseLabel.text = self.exercise.subMuscle;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
