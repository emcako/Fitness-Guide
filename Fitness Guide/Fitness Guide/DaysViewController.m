//
//  DaysViewController.m
//  Fitness Guide
//
//  Created by emcako on 02/02/2016.
//  Copyright © 2016 emcako. All rights reserved.
//

#import "DaysViewController.h"
#import "MondayTableViewController.h"

@interface DaysViewController ()
@end

@implementation DaysViewController

NSString *storyBoardIdTV = @"AllTableView";
MondayTableViewController* tvAll;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Days";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goToMondayTV:(id)sender {
    
    tvAll = [self.storyboard instantiateViewControllerWithIdentifier:storyBoardIdTV];
    tvAll.titleStirng = @"Monday";
    tvAll.className = @"MondayExercise";
    
    [self.navigationController pushViewController:tvAll animated:YES];

}
- (IBAction)goToTuesdayTV:(id)sender {
    
    tvAll = [self.storyboard instantiateViewControllerWithIdentifier:storyBoardIdTV];
    tvAll.titleStirng = @"Tuesday";
    tvAll.className = @"TuesdayExercise";
    
    [self.navigationController pushViewController:tvAll animated:YES];
}




- (IBAction)goToWednesdayTV:(id)sender {
    
    tvAll = [self.storyboard instantiateViewControllerWithIdentifier:storyBoardIdTV];
    tvAll.titleStirng = @"Wednesday";
    tvAll.className = @"WednesdayExercise";
    
    [self.navigationController pushViewController:tvAll animated:YES];
}

- (IBAction)goToThursdayTV:(id)sender {
    
    tvAll = [self.storyboard instantiateViewControllerWithIdentifier:storyBoardIdTV];
    tvAll.titleStirng = @"Thursday";
    tvAll.className = @"ThursdayExercise";
    
    [self.navigationController pushViewController:tvAll animated:YES];
}

- (IBAction)goToFridayTV:(id)sender {
    
    tvAll = [self.storyboard instantiateViewControllerWithIdentifier:storyBoardIdTV];
    tvAll.titleStirng = @"Friday";
    tvAll.className = @"FridayExercise";
    
    [self.navigationController pushViewController:tvAll animated:YES];
}

- (IBAction)goToSaturdayTV:(id)sender {
    
    tvAll = [self.storyboard instantiateViewControllerWithIdentifier:storyBoardIdTV];
    tvAll.titleStirng = @"Saturday";
    tvAll.className = @"SaturdayExercise";
    
    [self.navigationController pushViewController:tvAll animated:YES];
    
}
- (IBAction)goToSundayTV:(id)sender {
    
    tvAll = [self.storyboard instantiateViewControllerWithIdentifier:storyBoardIdTV];
    tvAll.titleStirng = @"Sunday";
    tvAll.className = @"SundayExercise";
    
    [self.navigationController pushViewController:tvAll animated:YES];
}

@end
