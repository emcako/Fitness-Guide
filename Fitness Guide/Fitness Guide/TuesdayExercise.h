//
//  TuesdayExercise.h
//  Fitness Guide
//
//  Created by emcako on 04/02/2016.
//  Copyright © 2016 emcako. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface TuesdayExercise : PFObject<PFSubclassing>

@property (strong, nonatomic) NSString* mainMuscle;
@property (strong, nonatomic) NSString* subMuscle;
@property (strong, nonatomic) NSString* explanation;
@property (strong, nonatomic) NSString* image;
@end
