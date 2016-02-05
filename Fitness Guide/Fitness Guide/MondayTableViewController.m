//
//  MondayTableViewController.m
//  Fitness Guide
//
//  Created by emcako on 03/02/2016.
//  Copyright © 2016 emcako. All rights reserved.
//

#import "MondayTableViewController.h"
#import "AddExerciseViewController.h"
#import "DetailsViewController.h"
#import "Exercise.h"
#import "MondayExercise.h"
#import "TuesdayExercise.h"
#import "WednesdayExercise.h"
#import "ThursdayExercise.h"
#import "FridayExercise.h"
#import "SaturdayExercise.h"
#import "SundayExercise.h"

@interface MondayTableViewController ()

@property (nonatomic, strong) NSMutableArray* mondayExercises; // da se smeni imeto

@end

@implementation MondayTableViewController



- (instancetype)init
{
    self = [super init];
    if (self) {
        self.mondayExercises = [NSMutableArray array];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = self.titleStirng;    // mqsto 1
    
    UIBarButtonItem *addBarButton =
    [[UIBarButtonItem alloc]
     initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
     target:self
     action:@selector(showAdd)];
    
    self.navigationItem.rightBarButtonItem = addBarButton;
    // tuka s PF object kato v add-Exercise trqbva da se izvika masiva ot bazata i da drapna datasoursa
    
    
    PFQuery* query = [PFQuery queryWithClassName:self.className]; // 2-ro mqsto(ili strinFormat)
    
    //    [query whereKey:@"name" equalTo:@"doncho"];
    
    __weak id weakSelf = self;
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error){
        
        if (!error) {
            [weakSelf setMondayExercises:[NSMutableArray arrayWithArray:objects]];
            [[weakSelf tableViewMonday ] reloadData];
        }
        
    }];

    
}

-(void) showAdd {
    NSString *storyBoardId = @"addExerciseScene";
    
    AddExerciseViewController *addExercise = [self.storyboard instantiateViewControllerWithIdentifier:storyBoardId];
    addExercise.check = self.title;
   
    [self.navigationController pushViewController:addExercise animated:YES];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    PFQuery* query = [PFQuery queryWithClassName:self.className];// 3-to mqsto (string format)
    

    __weak id weakSelf = self;
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error){
        
        if (!error) {
            [weakSelf setMondayExercises:[NSMutableArray arrayWithArray:objects]];
            [[weakSelf tableViewMonday ] reloadData];
        }
        
    }];

 }


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.mondayExercises.count;
}


static NSString* cellIdentifier = @"iden";
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [[self.mondayExercises objectAtIndex:indexPath.row] mainMuscle];
    return cell;
    
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *) indexPath {
    
    Exercise *exercise = [self.mondayExercises objectAtIndex:indexPath.row];
    NSString *storyBoardId = @"detailsScene";
    
    DetailsViewController* details =
    [self.storyboard instantiateViewControllerWithIdentifier:storyBoardId];
    details.exercise = exercise;
    
    [self.navigationController pushViewController:details animated:YES];
}



-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if( editingStyle == UITableViewCellEditingStyleDelete){
        
        if ([self.title isEqualToString:@"Monday"]) {
            
            MondayExercise* deleteCurrent = [self.mondayExercises objectAtIndex:indexPath.row];
            [deleteCurrent deleteInBackground];
            
        } else if ([self.title isEqualToString:@"Tuesday"]) {
            
            TuesdayExercise*  deleteCurrent = [self.mondayExercises objectAtIndex:indexPath.row];
            [deleteCurrent deleteInBackground];
            
        } else if ([self.title isEqualToString:@"Wednesday"]) {
            
           WednesdayExercise*  deleteCurrent = [self.mondayExercises objectAtIndex:indexPath.row];
           [deleteCurrent deleteInBackground];
            
        } else if ([self.title isEqualToString:@"Thursday"]) {
            
            ThursdayExercise*  deleteCurrent = [self.mondayExercises objectAtIndex:indexPath.row];
            [deleteCurrent deleteInBackground];
            
        } else if ([self.title isEqualToString:@"Friday"]) {
            
            FridayExercise*  deleteCurrent = [self.mondayExercises objectAtIndex:indexPath.row];
            [deleteCurrent deleteInBackground];
            
        } else if ([self.title isEqualToString:@"Saturday"]) {
            
            SaturdayExercise*  deleteCurrent = [self.mondayExercises objectAtIndex:indexPath.row];
            [deleteCurrent deleteInBackground];
            
        } else if ([self.title isEqualToString:@"Sunday"]) {
            
            SundayExercise*  deleteCurrent = [self.mondayExercises objectAtIndex:indexPath.row];
            [deleteCurrent deleteInBackground];
            
        }
    
        
       //za vaseki den
 
        PFQuery* query = [PFQuery queryWithClassName:self.className];// i tuk 4-to (stringFormat)
        
        __weak id weakSelf = self;
        [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error){
            
            if (!error) {
                [weakSelf setMondayExercises:[NSMutableArray arrayWithArray:objects]];
                [[weakSelf tableViewMonday ] reloadData];
                
            }
           
        }];
    }
}

@end
