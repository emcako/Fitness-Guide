//
//  Thursday.m
//  Fitness Guide
//
//  Created by emcako on 05/02/2016.
//  Copyright © 2016 emcako. All rights reserved.
//

#import "ThursdayExercise.h"

@implementation ThursdayExercise

@dynamic mainMuscle;
@dynamic subMuscle;
@dynamic explanation;

+(NSString *)parseClassName{
    return @"ThursdayExercise";
}

+(void)load{
    [self registerSubclass];
}


@end
