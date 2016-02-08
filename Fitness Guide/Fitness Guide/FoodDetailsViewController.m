//
//  FoodDetailsViewController.m
//  Fitness Guide
//
//  Created by emcako on 06/02/2016.
//  Copyright © 2016 emcako. All rights reserved.
//

#import "FoodDetailsViewController.h"

@interface FoodDetailsViewController ()

@end

@implementation FoodDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Details";
    self.foodDetailName.text = self.food.firstFood; // tuka trqbva da e NAME
    self.foodDetailProducts.text = [NSString stringWithFormat:@" %@, %@, %@ ",self.food.firstFood, self.food.secondFood, self.food.thirdFood];
    
    self.foodDetailImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@", self.food.picture]];
    
    
    
    
    UIPinchGestureRecognizer *pinchOnTextfield = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinch:)];
    [self.myTextField addGestureRecognizer:pinchOnTextfield];
    

    UITapGestureRecognizer* doubleTapp = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(nanana:)];
    doubleTapp.numberOfTapsRequired = 2;
    [self.myTextField addGestureRecognizer:doubleTapp];
    
    }



- (void)nanana:(UIPinchGestureRecognizer *)tapGesture{
    
    
    if (tapGesture.state == UIGestureRecognizerStateEnded
        || tapGesture.state == UIGestureRecognizerStateChanged) {
       
        self.myTextField.font = [UIFont fontWithName:self.myTextField.font.fontName size:15.0];
    }
    
}




- (void)pinch:(UIPinchGestureRecognizer *)pinchGestRecognizer{
    
    
    if (pinchGestRecognizer.state == UIGestureRecognizerStateEnded
        || pinchGestRecognizer.state == UIGestureRecognizerStateChanged) {
        
        CGFloat currentFontSize = self.myTextField.font.pointSize;
        CGFloat newScale = currentFontSize * pinchGestRecognizer.scale;
        
        
        if (newScale < 15.0) {
            newScale = 15.0;
        }
        if (newScale > 60.0) {
            newScale = 60.0;
        }
        
        self.myTextField.font = [UIFont fontWithName:self.myTextField.font.fontName size:newScale];
        pinchGestRecognizer.scale = 1;
        
    }
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
