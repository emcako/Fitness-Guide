//
//  MondayTableViewController.h
//  Fitness Guide
//
//  Created by emcako on 03/02/2016.
//  Copyright © 2016 emcako. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MondayTableViewController : UITableViewController<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableViewMonday;

@property(strong, nonatomic) NSString* titleStirng;

@property(strong, nonatomic) NSString* className;

@end
