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
    
}
