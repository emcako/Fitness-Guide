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
    self.title = @"Photos";
    
    
    UIImagePickerController* pickerController = [[UIImagePickerController alloc] init];
    pickerController.modalPresentationStyle = UIModalPresentationCurrentContext;
    pickerController.delegate = self;
    [self presentViewController:pickerController animated:YES completion:nil];

    
    
    
    UIBarButtonItem *addBarCamera =
    [[UIBarButtonItem alloc]
     initWithBarButtonSystemItem:UIBarButtonSystemItemCamera
     target:self
     action:@selector(showCamera)];
    
    self.navigationItem.rightBarButtonItem = addBarCamera;
    
    
    UIBarButtonItem *addBarPhotos =
    [[UIBarButtonItem alloc]
     initWithBarButtonSystemItem:UIBarButtonSystemItemDone
     target:self
     action:@selector(showPhotos)];
    
    
    
    self.navigationItem.leftBarButtonItem = addBarPhotos;
//
//    
//    UIImagePickerController* picker = [[UIImagePickerController alloc] init];
//    picker.delegate = self;
//    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
//    [self presentViewController:picker animated:NO completion:nil];
}


-(void)showCamera{

    UIImagePickerController* picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    [self presentViewController:picker animated:YES completion:nil];
    
}



-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{

    [self dismissViewControllerAnimated:YES completion:nil];
    
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    
   
    
        UIImage *image = info[UIImagePickerControllerOriginalImage];
        self.imageView.image = image;
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
     [self dismissViewControllerAnimated:YES completion:nil];
    
}


-(void)showPhotos{
    UIImagePickerController* picker = [[UIImagePickerController alloc] init];
    picker.modalPresentationStyle = UIModalPresentationCurrentContext;
    picker.delegate = self;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:picker animated:YES completion:nil];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
