//
//  DetailsViewController.h
//  Fitness Guide
//
//  Created by emcako on 04/02/2016.
//  Copyright © 2016 emcako. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Exercise.h"

@interface DetailsViewController : UIViewController

@property (nonatomic, strong) Exercise* exercise;

@property (weak, nonatomic) IBOutlet UILabel *muscleLabel;

@property (weak, nonatomic) IBOutlet UILabel *exerciseLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@end
