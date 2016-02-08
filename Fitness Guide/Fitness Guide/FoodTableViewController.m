//
//  FoodTableViewController.m
//  Fitness Guide
//
//  Created by emcako on 02/02/2016.
//  Copyright © 2016 emcako. All rights reserved.
//

#import "FoodTableViewController.h"
#import "Breakfast.h"
#import "Lunch.h"
#import "Dinner.h"
#import "AvoidFood.h"
#import "FoodDetailsViewController.h"
#import "ExerciseCell.h"

@interface FoodTableViewController ()
@property (nonatomic, strong) NSMutableArray* currentFoods;
@end

@implementation FoodTableViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.currentFoods = [NSMutableArray array];
    }
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
   self.title = self.titleStirng;
    
    PFQuery* query = [PFQuery queryWithClassName:self.className]; 
    
    
    
    __weak id weakSelf = self;
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error){
        
        if (!error) {
            [weakSelf setCurrentFoods:[NSMutableArray arrayWithArray:objects]];
            [[weakSelf foodTableView ] reloadData];
        }
        
    }];
    

}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.currentFoods.count;
}


static NSString* cellIdentifier = @"iden";
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ExerciseCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
     
         cell = [[[NSBundle mainBundle] loadNibNamed:@"ExerciseCell" owner:self options:nil] objectAtIndex:0];
        
    }
    
    Breakfast* food = [self.currentFoods objectAtIndex:indexPath.row];
    
    cell.mainMuscleLabel.text = food.firstFood;
    cell.subMuscleLabel.text = [NSString stringWithFormat:@"%@, %@",food.secondFood, food.thirdFood];
    cell.cellImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@", food.picture]];
    return cell;
    
    
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *) indexPath {
    
    Breakfast *food = [self.currentFoods objectAtIndex:indexPath.row];
    NSString *storyBoardId = @"foodDetailScene";
    
    FoodDetailsViewController* details =
    [self.storyboard instantiateViewControllerWithIdentifier:storyBoardId];
    details.food = food;
    
    [self.navigationController pushViewController:details animated:YES];
}







-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
