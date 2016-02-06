//
//  FoodViewController.m
//  Fitness Guide
//
//  Created by emcako on 06/02/2016.
//  Copyright © 2016 emcako. All rights reserved.
//

#import "FoodViewController.h"
#import "FoodTableViewController.h"

@interface FoodViewController ()

@end

@implementation FoodViewController

NSString* storyboardFood = @"foodScene";
FoodTableViewController* food;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Food";
   }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goToBreakfast:(id)sender {
    food = [self.storyboard instantiateViewControllerWithIdentifier:storyboardFood];
    food.titleStirng = @"Breakfast";
    food.className = @"Breakfast";
    
    [self.navigationController pushViewController:food animated:YES];
}

- (IBAction)goToLunch:(id)sender {
    
    food = [self.storyboard instantiateViewControllerWithIdentifier:storyboardFood];
        food.titleStirng = @"Lunch";
        food.className = @"Lunch";
    
    [self.navigationController pushViewController:food animated:YES];
}

- (IBAction)goToDinner:(id)sender {
    
    food = [self.storyboard instantiateViewControllerWithIdentifier:storyboardFood];
        food.titleStirng = @"Dinner";
        food.className = @"Dinner";
    
    [self.navigationController pushViewController:food animated:YES];
}

- (IBAction)goToAvoid:(id)sender {
    
    food = [self.storyboard instantiateViewControllerWithIdentifier:storyboardFood];
        food.titleStirng = @"AvoidFood";
        food.className = @"AvoidFood";
    
    [self.navigationController pushViewController:food animated:YES];
}


@end
