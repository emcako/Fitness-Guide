//
//  DetailsViewController.m
//  Fitness Guide
//
//  Created by emcako on 04/02/2016.
//  Copyright © 2016 emcako. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Details";
    self.muscleLabel.text = self.exercise.mainMuscle;
    self.exerciseLabel.text = self.exercise.subMuscle;
    self.myTextView.text = self.exercise.explanation;
    self.deteilsDayViewImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@", self.exercise.image]];
    
    
    
    
    
    UIPinchGestureRecognizer *pinchOnTextfield = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handleTextFieldFont:)];
    [self.myTextView addGestureRecognizer:pinchOnTextfield];

    
    UITapGestureRecognizer* doubleTapp = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(nanana:)];
    doubleTapp.numberOfTapsRequired = 2;
    [self.myTextView addGestureRecognizer:doubleTapp];
}

- (void)nanana:(UIPinchGestureRecognizer *)tapGesture{
    
    
    if (tapGesture.state == UIGestureRecognizerStateEnded
        || tapGesture.state == UIGestureRecognizerStateChanged) {
        
        self.myTextView.font = [UIFont fontWithName:self.myTextView.font.fontName size:15.0];
    }
    
}

- (void)handleTextFieldFont:(UIPinchGestureRecognizer *)pinchGestRecognizer{
    
    
    if (pinchGestRecognizer.state == UIGestureRecognizerStateEnded
        || pinchGestRecognizer.state == UIGestureRecognizerStateChanged) {
        
        CGFloat currentFontSize = self.myTextView.font.pointSize;
        CGFloat newScale = currentFontSize * pinchGestRecognizer.scale;
        
        
        if (newScale < 15.0) {
            newScale = 15.0;
        }
        if (newScale > 60.0) {
            newScale = 60.0;
        }
        
        self.myTextView.font = [UIFont fontWithName:self.myTextView.font.fontName size:newScale];
        pinchGestRecognizer.scale = 1;
        
    }
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
