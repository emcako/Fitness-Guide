//
//  SaturdayExercise.m
//  Fitness Guide
//
//  Created by emcako on 05/02/2016.
//  Copyright © 2016 emcako. All rights reserved.
//

#import "SaturdayExercise.h"

@implementation SaturdayExercise

@dynamic mainMuscle;
@dynamic subMuscle;
@dynamic explanation;
@dynamic image;

+(NSString *)parseClassName{
    return @"SaturdayExercise";
}

+(void)load{
    [self registerSubclass];
}

@end
