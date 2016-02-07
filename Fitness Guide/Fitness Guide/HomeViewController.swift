//
//  HomeViewController.swift
//  Fitness Guide
//
//  Created by emcako on 07/02/2016.
//  Copyright © 2016 emcako. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    

    @IBOutlet weak var homeImageView: UIImageView!
    
    var backgroundTaskIdentifier: UIBackgroundTaskIdentifier?
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        homeImageView.image = UIImage(named: "ppp")
        
        backgroundTaskIdentifier = UIApplication.sharedApplication().beginBackgroundTaskWithExpirationHandler({
            UIApplication.sharedApplication().endBackgroundTask(self.backgroundTaskIdentifier!)
        })
        
        _ = NSTimer.scheduledTimerWithTimeInterval(300.0, target: self, selector: Selector("Notification"), userInfo: nil, repeats: true)
    }

    
    
    
    func Notification(){
        
        let Notification = UILocalNotification()
        Notification.alertAction = "Go back to App"
        Notification.alertBody = "It is time to change your program!!!"
        Notification.fireDate = NSDate(timeIntervalSinceNow:0)
        
        UIApplication.sharedApplication().scheduleLocalNotification(Notification)
    }

    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //    Exercise* exercise = [Exercise object];
    //
    //    exercise.mainMuscle = @"Back";
    //    exercise.subMuscle = @"Out Side";
    //    exercise.explanation = @"The exercise is mainly for the laterial muscles.It help for building wide back!";
    //    exercise.array = [NSMutableArray arrayWithObjects:@"sasa",@"dsrfsgs", nil];
    //    // day.monDay = [ prazen masiv i tuka se dobavqt neshtata]
    //    [exercise saveInBackground];   // s bloxk i v nego alert za success
    
    //    Dinner* monday = [Dinner object];
    //    monday.firstFood=@"muslei";
    //    monday.secondFood = @"Milk";
    //    monday.thirdFood = @"Banana";
    //    monday.explanation = @"Put the muslei in a bow around 100 grams and put 200 ml of milk.Leave it like that to stay around 40 minets.After that take one banana and cut it on rolls . Put the banana in the bow and mix it.Alwso you can put a litte bit of non calorical swetener";
    //    monday.picture = @"musleiMilk";
    //
    //
    //    [monday saveInBackground];
    //
    //    Dinner* monday1 = [Dinner object];
    //    monday1.firstFood=@"muslei";
    //    monday1.secondFood = @"Milk";
    //    monday1.thirdFood = @"Banana";
    //    monday1.explanation = @"Put the muslei in a bow around 100 grams and put 200 ml of milk.Leave it like that to stay around 40 minets.After that take one banana and cut it on rolls . Put the banana in the bow and mix it.Alwso you can put a litte bit of non calorical swetener";
    //    monday1.picture = @"musleiMilk";
    //
    //
    //    [monday1 saveInBackground];
    //
    //    Dinner* monday2 = [Dinner object];
    //    monday2.firstFood=@"muslei";
    //    monday2.secondFood = @"Milk";
    //    monday2.thirdFood = @"Banana";
    //    monday2.explanation = @"Put the muslei in a bow around 100 grams and put 200 ml of milk.Leave it like that to stay around 40 minets.After that take one banana and cut it on rolls . Put the banana in the bow and mix it.Alwso you can put a litte bit of non calorical swetener";
    //    monday.picture = @"musleiMilk";
    //
    //
    //    [monday2 saveInBackground];
    //
    //    AvoidFood* monday3 = [AvoidFood object];
    //    monday3.firstFood=@"muslei";
    //    monday3.secondFood = @"Milk";
    //    monday3.thirdFood = @"Banana";
    //    monday3.explanation = @"Put the muslei in a bow around 100 grams and put 200 ml of milk.Leave it like that to stay around 40 minets.After that take one banana and cut it on rolls . Put the banana in the bow and mix it.Alwso you can put a litte bit of non calorical swetener";
    //    monday3.picture = @"musleiMilk";
    //    
    //    
    //    [monday3 saveInBackground];
    //

}
