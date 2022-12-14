//
//  CategoryTableViewController.swift
//  CaseStudySprint2
//
//  Created by Capgemini-DA226 on 9/21/22.
//

import UIKit
import Alamofire

class CategoryTableViewController: UITableViewController {

    //MARK: Variables
    //MARK: Category Data array
    var categroryData = [String]()
    
    //MARK: Category image array
    var categoryImageArray = ["smartphone2.png","laptop.png", "fragrances.png", "skincare.png", "groceries.png", "homedecor.png","furniture2.png","tops.png", "dress.png", "footwear.png", "shirts.png", "shoes.png","watches.png","womenwatch.png", "handbags.png", "jewellery.png", "sunglasses.png", "Automative.png","motorcycle.png", "lighting.png"]

    override func viewDidLoad() {
        super.viewDidLoad()
    
        alamofireJsonData()
    
        //Registering cell if not register then app crashes
        self.tableView.register(UINib(nibName: "CategoryTableViewCell", bundle: nil), forCellReuseIdentifier: "CategoryTableViewCell")
    }

    
    //Calling Category API
    func alamofireJsonData() {
        
        Alamofire.request("https://dummyjson.com/products/categories", method: .get, encoding: URLEncoding.default, headers: nil).responseJSON { response in
            switch response.result {
                case .success:
                if let categoryDict: NSArray = response.value as! NSArray? {
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
        // return the number of sections
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
        
        let addToCartViewController = self.storyboard?.instantiateViewController(withIdentifier: "addToCartTableViewController") as! AddToCartTableViewController
        
        //get the category name to print that speicific data on table view
        let categorySelectedName = categroryData[indexPath.row]
        addToCartViewController.categoryName = categorySelectedName
        
        self.navigationController?.pushViewController(addToCartViewController, animated: true)
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
     //  return UITableView.automaticDimension
        return 60
        
    }

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
