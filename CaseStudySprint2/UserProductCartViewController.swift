//
//  ProductCartViewController.swift
//  CaseStudySprint2
//
//  Created by Capgemini-DA226 on 9/25/22.
//

import UIKit

//MARK: Class
class ProductCartViewCell: UITableViewCell {
    
    //MARK: IBOutlets
    @IBOutlet weak var cartProductNameLabel: UILabel!
}

//MARK: User Product Cart Class
class UserProductCartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var userProductsTableView: UITableView!
    
    //MARK: Variables
    let userCartArray = DBOperationsManager.dbManagerSharedInstance().fetchProductRecord()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        userCartArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCartIdentifier") as! ProductCartViewCell
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
