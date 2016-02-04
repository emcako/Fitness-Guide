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


@interface MondayTableViewController ()

@property (nonatomic, strong) NSMutableArray* monday;

@end

@implementation MondayTableViewController



- (instancetype)init
{
    self = [super init];
    if (self) {
        self.monday = [NSMutableArray array];
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
            [weakSelf setMonday:[NSMutableArray arrayWithArray:objects]];
            [[weakSelf tableViewMonday ] reloadData];
        }
        
    }];

    
    }


-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    PFQuery* query = [PFQuery queryWithClassName:[MondayExercise parseClassName]];
    
    //    [query whereKey:@"name" equalTo:@"doncho"];
    
    __weak id weakSelf = self;
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error){
        
        if (!error) {
            [weakSelf setMonday:[NSMutableArray arrayWithArray:objects]];
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
    
    return self.monday.count;
}


static NSString* cellIdentifier = @"iden";
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [[self.monday objectAtIndex:indexPath.row] mainMuscle];
    return cell;
    
    
}



@end