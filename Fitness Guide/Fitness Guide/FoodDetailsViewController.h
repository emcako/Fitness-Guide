//
//  FoodDetailsViewController.h
//  Fitness Guide
//
//  Created by emcako on 06/02/2016.
//  Copyright © 2016 emcako. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Breakfast.h"

@interface FoodDetailsViewController : UIViewController

@property (nonatomic, strong) Breakfast* food;

@property (weak, nonatomic) IBOutlet UILabel *foodDetailName;

@property (weak, nonatomic) IBOutlet UILabel *foodDetailProducts;

@property (weak, nonatomic) IBOutlet UIImageView *foodDetailImageView;

@end
