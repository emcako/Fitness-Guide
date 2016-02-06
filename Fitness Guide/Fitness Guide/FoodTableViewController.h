//
//  FoodTableViewController.h
//  Fitness Guide
//
//  Created by emcako on 02/02/2016.
//  Copyright © 2016 emcako. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FoodTableViewController : UITableViewController<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *foodTableView;

@property(strong, nonatomic) NSString* titleStirng;

@property(strong, nonatomic) NSString* className;

@end
