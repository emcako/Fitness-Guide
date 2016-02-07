//
//  MondayExercise.m
//  Fitness Guide
//
//  Created by emcako on 04/02/2016.
//  Copyright © 2016 emcako. All rights reserved.
//

#import "MondayExercise.h"

@implementation MondayExercise

@dynamic mainMuscle;
@dynamic subMuscle;
@dynamic explanation;
@dynamic image;

+(NSString *)parseClassName{
    return @"MondayExercise";
}

+(void)load{
    [self registerSubclass];
}


@end
