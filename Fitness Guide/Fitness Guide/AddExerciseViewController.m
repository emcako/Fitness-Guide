//
//  AddExerciseViewController.m
//  Fitness Guide
//
//  Created by emcako on 03/02/2016.
//  Copyright © 2016 emcako. All rights reserved.
//

#import "AddExerciseViewController.h"
#import "Exercise.h"
#import "MondayExercise.h"


@interface AddExerciseViewController ()

@property (nonatomic, strong) NSMutableArray* exercises;

@property (nonatomic, strong) Exercise* currentExercise;

@property (nonatomic, strong) MondayExercise* monday;

@end

@implementation AddExerciseViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.exercises = [NSMutableArray array];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    
    
    self.title = @"Add Exercise";
    // tuka se vadqt i dobavqt obektite v parse
    
    PFQuery* query = [PFQuery queryWithClassName:[Exercise parseClassName]];
    
//    [query whereKey:@"name" equalTo:@"doncho"];
    
    __weak id weakSelf = self;
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error){
      
        if (!error) {
            [weakSelf setExercises:[NSMutableArray arrayWithArray:objects]];
            [[weakSelf tableViewAddExercise ] reloadData];
        }
        
    }];
    
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.exercises.count;
}

static NSString* cellIdentifier = @"iden";

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [[self.exercises objectAtIndex:indexPath.row] mainMuscle];
    return cell;

    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.currentExercise = [self.exercises objectAtIndex:indexPath.row];
    
    self.monday = [MondayExercise object];
    self.monday.mainMuscle = [NSString stringWithFormat:@"%@", self.currentExercise.mainMuscle];
}


- (IBAction)addExercise:(id)sender {
    [self.monday saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        if (succeeded) {
            UIAlertView *messageAlert = [[UIAlertView alloc]
                                         initWithTitle:@"Added successfully" message:[NSString stringWithFormat:@"You added %@ exercise",self.currentExercise.subMuscle]
                                         delegate:nil
                                         cancelButtonTitle:@"OK"
                                         otherButtonTitles:nil];
            
            // Display Alert Message
            [messageAlert show];
            [self.navigationController popViewControllerAnimated:YES];
        }
    }];
}

@end
