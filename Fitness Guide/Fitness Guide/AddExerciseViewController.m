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
#import "TuesdayExercise.h"
#import "WednesdayExercise.h"
#import "ThursdayExercise.h"
#import "FridayExercise.h"
#import "SaturdayExercise.h"
#import "SundayExercise.h"
#import "ExerciseCell.h"


@interface AddExerciseViewController ()

@property (nonatomic, strong) NSMutableArray* exercises;

@property (nonatomic, strong) Exercise* currentExercise;

@property (nonatomic, strong) MondayExercise* monday;
@property (nonatomic, strong) TuesdayExercise* tuesday;
@property (nonatomic, strong) WednesdayExercise* wednesday;
@property (nonatomic, strong) ThursdayExercise* thursday;
@property (nonatomic, strong) FridayExercise* friday;
@property (nonatomic, strong) SaturdayExercise* saturday;
@property (nonatomic, strong) SundayExercise* sunday;
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
    
    PFQuery* query = [PFQuery queryWithClassName:[Exercise parseClassName]];
    

    
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
    
    ExerciseCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ExerciseCell" owner:self options:nil] objectAtIndex:0];
    }
    
    Exercise* exercise = [self.exercises objectAtIndex:indexPath.row];
    cell.mainMuscleLabel.text = exercise.mainMuscle;
    cell.subMuscleLabel.text = exercise.subMuscle;
    cell.cellImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",exercise.image]];
    
    return cell;
}


static int num = 0;

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.currentExercise = [self.exercises objectAtIndex:indexPath.row];
    
    if ([self.check  isEqual: @"Monday"]) {
        
        self.monday = [MondayExercise object];
        self.monday.mainMuscle = [NSString stringWithFormat:@"%@", self.currentExercise.mainMuscle];
        self.monday.subMuscle = [NSString stringWithFormat:@"%@", self.currentExercise.subMuscle];
        self.monday.explanation = [NSString stringWithFormat:@"%@", self.currentExercise.explanation];
        self.monday.image = [NSString stringWithFormat:@"%@",self.currentExercise.image];
        num = 1;
        
    } else if ([self.check  isEqual: @"Tuesday"]){
        
        self.tuesday = [TuesdayExercise object];
        self.tuesday.mainMuscle = [NSString stringWithFormat:@"%@", self.currentExercise.mainMuscle];
        self.tuesday.subMuscle = [NSString stringWithFormat:@"%@", self.currentExercise.subMuscle];
        self.tuesday.explanation = [NSString stringWithFormat:@"%@", self.currentExercise.explanation];
        self.tuesday.image = [NSString stringWithFormat:@"%@",self.currentExercise.image];
        num = 2;
        
    } else if ([self.check  isEqual: @"Wednesday"]){
        
        self.wednesday = [WednesdayExercise object];
        self.wednesday.mainMuscle = [NSString stringWithFormat:@"%@", self.currentExercise.mainMuscle];
        self.wednesday.subMuscle = [NSString stringWithFormat:@"%@", self.currentExercise.subMuscle];
        self.wednesday.explanation = [NSString stringWithFormat:@"%@", self.currentExercise.explanation];
        self.wednesday.image = [NSString stringWithFormat:@"%@",self.currentExercise.image];
        num = 3;
        
    } else if ([self.check  isEqual: @"Thursday"]){
        
        self.thursday = [ThursdayExercise object];
        self.thursday.mainMuscle = [NSString stringWithFormat:@"%@", self.currentExercise.mainMuscle];
        self.thursday.subMuscle = [NSString stringWithFormat:@"%@", self.currentExercise.subMuscle];
        self.thursday.explanation = [NSString stringWithFormat:@"%@", self.currentExercise.explanation];
        self.thursday.image = [NSString stringWithFormat:@"%@",self.currentExercise.image];
        
        num = 4;
        
    } else if ([self.check  isEqual: @"Friday"]){
        
        self.friday = [FridayExercise object];
        self.friday.mainMuscle = [NSString stringWithFormat:@"%@", self.currentExercise.mainMuscle];
        self.friday.subMuscle = [NSString stringWithFormat:@"%@", self.currentExercise.subMuscle];
        self.friday.explanation = [NSString stringWithFormat:@"%@", self.currentExercise.explanation];
        self.friday.image = [NSString stringWithFormat:@"%@",self.currentExercise.image];
        num = 5;
        
    } else if ([self.check  isEqual: @"Saturday"]){
        
        self.saturday = [SaturdayExercise object];
        self.saturday.mainMuscle = [NSString stringWithFormat:@"%@", self.currentExercise.mainMuscle];
        self.saturday.subMuscle = [NSString stringWithFormat:@"%@", self.currentExercise.subMuscle];
        self.saturday.explanation = [NSString stringWithFormat:@"%@", self.currentExercise.explanation];
        self.saturday.image = [NSString stringWithFormat:@"%@",self.currentExercise.image];
        num = 6;
        
    } else if ([self.check  isEqual: @"Sunday"]){
        
        self.sunday = [SundayExercise object];
        self.sunday.mainMuscle = [NSString stringWithFormat:@"%@", self.currentExercise.mainMuscle];
        self.sunday.subMuscle = [NSString stringWithFormat:@"%@", self.currentExercise.subMuscle];
        self.sunday.explanation = [NSString stringWithFormat:@"%@", self.currentExercise.explanation];
        self.sunday.image = [NSString stringWithFormat:@"%@",self.currentExercise.image];
        num = 7;
        
    }
    
    
}


static UIAlertView*  messageAlertSuccess;
static UIAlertView*  messageAlertError;
- (IBAction)addExercise:(id)sender {
    
    //validation for adding in any day of week
    messageAlertSuccess = [[UIAlertView alloc] initWithTitle:@"Added successfully" message:[NSString stringWithFormat:@"You added %@ exercise",
                                                                                            self.currentExercise.subMuscle]
                                                    delegate:nil
                                           cancelButtonTitle:@"OK"
                                           otherButtonTitles:nil];
    
    
    
    messageAlertError = [[UIAlertView alloc] initWithTitle:@"ERROR" message:@" The exercise is not added"
                                                  delegate:nil
                                         cancelButtonTitle:@"OK"
                                         otherButtonTitles:nil];

    
    if (num == 1) {
        [self.monday saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
            if (succeeded) {
               [messageAlertSuccess show];
               num = 0;
            } else {
                [messageAlertError show];
            }
        }];
    } else if (num == 2){
        [self.tuesday saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
            if (succeeded) {
                [messageAlertSuccess show];
                num = 0;
            } else {
                [messageAlertError show];
            }

        }];
    } else if (num == 3){
        [self.wednesday saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
            if (succeeded) {
                [messageAlertSuccess show];
                num = 0;
            } else {
                [messageAlertError show];
            }
        }];
    } else if (num == 4){
        [self.thursday saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
            if (succeeded) {
                [messageAlertSuccess show];
                num = 0;
            } else {
                [messageAlertError show];
            }
        }];
    } else if (num == 5){
        [self.friday saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
            if (succeeded) {
                [messageAlertSuccess show];
                num = 0;
            } else {
                [messageAlertError show];
            }
        }];
    } else if (num == 6){
        [self.saturday saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
            if (succeeded) {
                [messageAlertSuccess show];
                num = 0;
            } else {
                [messageAlertError show];
            }
        }];
    } else if (num == 7){
        [self.sunday saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
            if (succeeded) {
                [messageAlertSuccess show];
            } else {
                [messageAlertError show];
            }
        }];
    } else {
        [messageAlertError show];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
     
   
}



-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}
@end
