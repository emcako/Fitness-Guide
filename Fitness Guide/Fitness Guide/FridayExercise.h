//
//  FridayExercise.h
//  Fitness Guide
//
//  Created by emcako on 05/02/2016.
//  Copyright © 2016 emcako. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface FridayExercise : PFObject<PFSubclassing>

@property (strong, nonatomic) NSString* mainMuscle;
@property (strong, nonatomic) NSString* subMuscle;
@property (strong, nonatomic) NSString* explanation;

@end
