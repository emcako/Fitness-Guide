//
//  FoodDetailsViewController.m
//  Fitness Guide
//
//  Created by emcako on 06/02/2016.
//  Copyright © 2016 emcako. All rights reserved.
//

#import "FoodDetailsViewController.h"

@interface FoodDetailsViewController ()

@end

@implementation FoodDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Details";
    self.foodDetailName.text = self.food.firstFood; // tuka trqbva da e NAME
    self.foodDetailProducts.text = [NSString stringWithFormat:@" %@, %@, %@ ",self.food.firstFood, self.food.secondFood, self.food.thirdFood];
    
    self.foodDetailImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@", self.food.picture]];
    
    }












- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
