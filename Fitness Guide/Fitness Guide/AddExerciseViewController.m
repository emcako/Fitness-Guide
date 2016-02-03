//
//  AddExerciseViewController.m
//  Fitness Guide
//
//  Created by emcako on 03/02/2016.
//  Copyright © 2016 emcako. All rights reserved.
//

#import "AddExerciseViewController.h"
#import "Exercise.h"


@interface AddExerciseViewController ()

@property (nonatomic, strong) NSMutableArray* exercises;

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

@end
