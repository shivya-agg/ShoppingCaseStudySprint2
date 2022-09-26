//
//  NotificationViewController.swift
//  CaseStudySprint2
//
//  Created by Capgemini-DA226 on 9/25/22.
//

import UIKit
import LocalNotificationFramework

class NotificationViewController: UIViewController {

    
    let placedOrderNotifcation = NotificationTriggerViewController()

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.hidesBackButton = true
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func localNotificationButtonClicked(_ sender: Any) {
        placedOrderNotifcation.localNotification()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
