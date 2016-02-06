//
//  GaleryViewController.m
//  Fitness Guide
//
//  Created by emcako on 06/02/2016.
//  Copyright © 2016 emcako. All rights reserved.
//

#import "GaleryViewController.h"

@interface GaleryViewController ()

@end

@implementation GaleryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIBarButtonItem *addBarCamera =
    [[UIBarButtonItem alloc]
     initWithBarButtonSystemItem:UIBarButtonSystemItemCamera
     target:self
     action:@selector(showCamera)];
    
    self.navigationItem.rightBarButtonItem = addBarCamera;
    // Do any additional setup after loading the view.
}


-(void)showCamera{

    UIImagePickerController* picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    [self presentViewController:picker animated:NO completion:nil];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
