//
//  CategoryTableViewController.swift
//  CaseStudySprint2
//
//  Created by Capgemini-DA226 on 9/21/22.
//

import UIKit
import Alamofire

class CategoryTableViewController: UITableViewController {

   //creating category data array
    var categroryData = [String]()
    var categoryImageArray = ["mobile.png","authentication.png", "loginUser.png", "signupMail.png", "signupUser.png", "signupUserPassword.png","mobile.png","authentication.png", "loginUser.png", "signupMail.png", "signupUser.png", "signupUserPassword.png","mobile.png","authentication.png", "loginUser.png", "signupMail.png", "signupUser.png", "signupUserPassword.png","signupUser.png", "signupUserPassword.png"]

    override func viewDidLoad() {
        super.viewDidLoad()
        alamofireJsonData()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        //Registering cell if not register then app crashes
        self.tableView.register(UINib(nibName: "CategoryTableViewCell", bundle: nil), forCellReuseIdentifier: "CategoryTableViewCell")
    }

    
    //Calling Category API
    func alamofireJsonData() {
        
        Alamofire.request("https://dummyjson.com/products/categories", method: .get, encoding: URLEncoding.default, headers: nil).responseJSON { response in
            switch response.result {
                case .success:
                if let categoryDict: NSArray = response.value as! NSArray? {
                    print(categoryDict)
                    self.categroryData = categoryDict as! [String]
                    
                    if self.categroryData.count > 0 {
                        self.tableView.reloadData()
                    }
                }
                break
                case .failure(let error):
                    print(error)
            }
        }
        
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return categroryData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! CategoryTableViewCell
        
        //setting label to category
        let dict = categroryData[indexPath.row]
        cell.categoryLabel.text = dict as String
        
        //adding category image
        let categoryImage = categoryImageArray[indexPath.row]
        cell.imageView?.image = UIImage(named: categoryImage)
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let addToCartViewController = self.storyboard?.instantiateViewController(withIdentifier: "addToCartViewController") as! AddToCartViewController
        self.navigationController?.pushViewController(addToCartViewController, animated: true)
    }
    
 /*   override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
*/
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
