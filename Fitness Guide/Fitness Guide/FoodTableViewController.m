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
    
    PFQuery* query = [PFQuery queryWithClassName:self.className]; // 2-ro mqsto(ili strinFormat)
    
    //    [query whereKey:@"name" equalTo:@"doncho"];
    
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
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
     
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
    }
    
    Breakfast* food = [self.currentFoods objectAtIndex:indexPath.row]; // koito e reda taq e hranata
    
    cell.textLabel.text = food.firstFood;   // a tuka trqbva da e name s koito se oboznachava qstieto
    
    cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@", food.picture]]; // food.picture ( samo stringa deto e tricepss)
    
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
