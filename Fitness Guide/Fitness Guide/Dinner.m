//
//  Dinner.m
//  Fitness Guide
//
//  Created by emcako on 06/02/2016.
//  Copyright © 2016 emcako. All rights reserved.
//

#import "Dinner.h"

@implementation Dinner

@dynamic firstFood;
@dynamic secondFood;
@dynamic thirdFood;
@dynamic explanation;
@dynamic picture;

+(NSString *)parseClassName{
    return @"Dinner";
}

+(void)load{
    [self registerSubclass];
}

@end
