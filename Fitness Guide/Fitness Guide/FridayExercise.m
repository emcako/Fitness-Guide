//
//  FridayExercise.m
//  Fitness Guide
//
//  Created by emcako on 05/02/2016.
//  Copyright © 2016 emcako. All rights reserved.
//

#import "FridayExercise.h"

@implementation FridayExercise

@dynamic mainMuscle;
@dynamic subMuscle;
@dynamic explanation;

+(NSString *)parseClassName{
    return @"FridayExercise";
}

+(void)load{
    [self registerSubclass];
}

@end
