//
//  NotificationViewController.swift
//  CaseStudySprint2
//
//  Created by Capgemini-DA226 on 9/25/22.
//

import UIKit
import LocalNotificationFramework

class NotificationViewController: UIViewController {

    //MARK: Instance of class created inside LocalNotification Framework
    //to access the methods of class creating an instance of the class
    let placedOrderNotifcation = NotificationTriggerViewController()

    
    //MARK: IBActions
    @IBOutlet weak var localNotificationButton: UIButton!
    
    //MARK: Life cycle methods
    override func viewDidLoad() {
        
        super.viewDidLoad()
        localNotificationButton.layer.cornerRadius = 15
        
        let newBackButton = UIBarButtonItem(title: "Category list", style: .plain, target: self, action: #selector(back(sender:)))
        self.navigationItem.leftBarButtonItem = newBackButton
        
    }
    
    @objc func back(sender: UIBarButtonItem) {
       let controllers = self.navigationController?.viewControllers
        for vc in controllers! {
            print(vc)
            if vc is UserProductCartTableViewController {
                _ = self.navigationController?.popToViewController(vc as! UserProductCartTableViewController, animated: true)
            }
        }
    }
    
    //MARK: IBActions
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
