//
//  CheckoutViewController.swift
//  CaseStudySprint2
//
//  Created by Capgemini-DA226 on 9/25/22.
//

import UIKit

//MARK: Class
class CheckoutViewController: UIViewController {

    //MARK: IBOutlets
    @IBOutlet weak var orderNowButton: UIButton!
    
    //MARK: Life cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        orderNowButton.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }
    

    //MARK: IBActions
    @IBAction func orderNowButtonClicked(_ sender: Any) {
        
        //on checkout button click navigating to notification screen
        
        let notificationViewController = self.storyboard?.instantiateViewController(withIdentifier: "notificationViewController") as! NotificationViewController
        
        self.navigationController?.pushViewController(notificationViewController, animated: true)
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
