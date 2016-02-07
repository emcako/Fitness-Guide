//
//  Exercise.m
//  Fitness Guide
//
//  Created by emcako on 03/02/2016.
//  Copyright © 2016 emcako. All rights reserved.
//

#import "Exercise.h"

@implementation Exercise

@dynamic mainMuscle;
@dynamic subMuscle;
@dynamic explanation;
@dynamic image;

+(NSString *)parseClassName{
    return @"Exercise";
}

+(void)load{
    [self registerSubclass];
}
@end
