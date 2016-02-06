//
//  Breakfast.h
//  Fitness Guide
//
//  Created by emcako on 06/02/2016.
//  Copyright © 2016 emcako. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface Breakfast : PFObject<PFSubclassing>
@property (strong, nonatomic) NSString* firstFood;
@property (strong, nonatomic) NSString* secondFood;
@property (strong, nonatomic) NSString* thirdFood;
@property (strong, nonatomic) NSString* explanation;
@property (strong, nonatomic) NSString* picture;


@end
