//
//  WednesdayExercise.m
//  Fitness Guide
//
//  Created by emcako on 05/02/2016.
//  Copyright © 2016 emcako. All rights reserved.
//

#import "WednesdayExercise.h"

@implementation WednesdayExercise

@dynamic mainMuscle;
@dynamic subMuscle;
@dynamic explanation;

+(NSString *)parseClassName{
    return @"WednesdayExercise";
}

+(void)load{
    [self registerSubclass];
}

@end
