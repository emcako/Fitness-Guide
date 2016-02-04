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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
