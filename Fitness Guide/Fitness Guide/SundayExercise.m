//
//  SunDayExercise.m
//  Fitness Guide
//
//  Created by emcako on 05/02/2016.
//  Copyright © 2016 emcako. All rights reserved.
//

#import "SundayExercise.h"

@implementation SundayExercise

@dynamic mainMuscle;
@dynamic subMuscle;
@dynamic explanation;

+(NSString *)parseClassName{
    return @"SundayExercise";
}

+(void)load{
    [self registerSubclass];
}

@end
