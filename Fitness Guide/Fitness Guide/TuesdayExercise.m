//
//  TuesdayExercise.m
//  Fitness Guide
//
//  Created by emcako on 04/02/2016.
//  Copyright © 2016 emcako. All rights reserved.
//

#import "TuesdayExercise.h"

@implementation TuesdayExercise

@dynamic mainMuscle;
@dynamic subMuscle;
@dynamic explanation;
@dynamic image;

+(NSString *)parseClassName{
    return @"TuesdayExercise";
}

+(void)load{
    [self registerSubclass];
}


@end


