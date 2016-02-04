//
//  MondayTableViewController.m
//  Fitness Guide
//
//  Created by emcako on 03/02/2016.
//  Copyright © 2016 emcako. All rights reserved.
//

#import "MondayTableViewController.h"
#import "AddExerciseViewController.h"
#import "Exercise.h"
#import "MondayExercise.h"
#import "DetailsViewController.h"


@interface MondayTableViewController ()

@property (nonatomic, strong) NSMutableArray* mondayExercises;

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
    
    self.title = @"Monday";
    
    UIBarButtonItem *addBarButton =
    [[UIBarButtonItem alloc]
     initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
     target:self
     action:@selector(showAdd)];
    
    self.navigationItem.rightBarButtonItem = addBarButton;
    // tuka s PF object kato v add-Exercise trqbva da se izvika masiva ot bazata i da drapna datasoursa
    
    
    PFQuery* query = [PFQuery queryWithClassName:[MondayExercise parseClassName]];
    
    //    [query whereKey:@"name" equalTo:@"doncho"];
    
    __weak id weakSelf = self;
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error){
        
        if (!error) {
            [weakSelf setMondayExercises:[NSMutableArray arrayWithArray:objects]];
            [[weakSelf tableViewMonday ] reloadData];
        }
        
    }];

    
    }


-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    PFQuery* query = [PFQuery queryWithClassName:[MondayExercise parseClassName]];
    

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
    
    [self.navigationController pushViewController:addExercise animated:YES];
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
        
        
        
       MondayExercise* deleteCurrent = [self.mondayExercises objectAtIndex:indexPath.row];
       [deleteCurrent deleteInBackground];
 
        PFQuery* query = [PFQuery queryWithClassName:[MondayExercise parseClassName]];
        
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
