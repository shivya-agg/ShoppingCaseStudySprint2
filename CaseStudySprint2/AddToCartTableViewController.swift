//
//  AddToCartTableViewController.swift
//  CaseStudySprint2
//
//  Created by Capgemini-DA226 on 9/24/22.
//

import UIKit
import Alamofire


class ProductTableViewCell: UITableViewCell {
    
    //MARK: IBOutlets
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    @IBOutlet weak var productCategoryImage: UIImageView?
    @IBOutlet weak var addToCartImage: UIImageView!
    
}
class AddToCartTableViewController: UITableViewController {
    
    //MARK: Variables
    var productArray = NSMutableArray()
    
    var categoryName: String?     //MARK: stores category name fetched from category list View controller

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlValue = url(categoryValue: categoryName!)
        alamofireProductsNetwork(api: urlValue)
        
       self.tableView.register(UINib(nibName: "ProductTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductTableViewCell")
      
    }
    //MARK: Functions
    func alamofireProductsNetwork (api: String) {
        
        //for a particular category loading specific api
        Alamofire.request(api, method: .get, encoding: URLEncoding.default, headers: nil).responseJSON { response in
            switch response.result {
                case .success:
                if let productDict: NSDictionary = response.value as! NSDictionary? {
                    print(productDict)
                    
                    let products = productDict["products"] as? [NSDictionary]
                    for product in products! {
                        self.productArray.add(product)
                       // print(product)
                    }
                    
                    DispatchQueue.main.async {
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
        return productArray.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productIdentifier", for: indexPath) as! ProductTableViewCell
        let product = productArray[indexPath.row] as! NSDictionary
        cell.productNameLabel.text = product.value(forKey: "title") as? String
        cell.productDescriptionLabel.text = product.value(forKey: "description") as? String
        
        //loading image url and storing it as string in imageUrl variable
        let imageUrl = URL(string: (product.value(forKey: "thumbnail") as! String))
        if let imageData = try? Data(contentsOf: imageUrl!) {
            if let loadedImage = UIImage(data: imageData) {
                cell.productCategoryImage?.image = loadedImage
            }
        }
        
        //adding gesture tap on add to cart image view cell
        let cartTapGesture = UITapGestureRecognizer(target: self, action: #selector(cartImageTapped(sender:)))
        cell.addToCartImage.tag = indexPath.row
        cell.addToCartImage.addGestureRecognizer(cartTapGesture)
        cell.addToCartImage.isUserInteractionEnabled = true
        
  
        return cell
    }
    
 
    //MARK: Image Tap Gesture function
    @objc func cartImageTapped(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            let selectedIndex = IndexPath(row: sender.view!.tag, section: 0)
            tableView.selectRow(at: selectedIndex, animated: true, scrollPosition: .none)
            let indexPath = tableView.indexPathForSelectedRow
            let currentCell = tableView.cellForRow(at: indexPath!) as! ProductTableViewCell
            let pTitle = currentCell.productNameLabel.text!
            let pData = currentCell.productDescriptionLabel.text!
            let productResult = DBOperationsManager.dbManagerSharedInstance().insertProductData(name: pTitle, detail: pData)
            if productResult {
                displayAlert(title: "Added to cart", message: "Product is successfully added to cart")
                tableView.deselectRow(at: selectedIndex, animated: true)
            }
        }
    }
 
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
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
