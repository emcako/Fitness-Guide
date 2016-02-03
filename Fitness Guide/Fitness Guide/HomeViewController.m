//
//  HomeViewController.m
//  Fitness Guide
//
//  Created by emcako on 02/02/2016.
//  Copyright © 2016 emcako. All rights reserved.
//

#import "HomeViewController.h"
#import <Parse/Parse.h>
#import "Exercise.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Home";
//    Exercise* exercise = [Exercise object];
//    
//    exercise.mainMuscle = @"Back";
//    exercise.subMuscle = @"Out Side";
//    exercise.explanation = @"The exercise is mainly for the laterial muscles.It help for building wide back!";
//    exercise.array = [NSMutableArray arrayWithObjects:@"sasa",@"dsrfsgs", nil];
//    // day.monDay = [ prazen masiv i tuka se dobavqt neshtata]
//    [exercise saveInBackground];   // s bloxk i v nego alert za success
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
