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
    @IBOutlet weak var addToCartImage: UIImageView!

}
class AddToCartTableViewController: UITableViewController {
    
    //MARK: Variables
    var productTitleArray = NSMutableArray()
    var productDescriptionArray = NSMutableArray()
    var productImageArray = NSMutableArray()
    override func viewDidLoad() {
        super.viewDidLoad()

        alamofireProductsNetwork()
        
       self.tableView.register(UINib(nibName: "ProductTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductTableViewCell")
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    

    //MARK: Functions
    func alamofireProductsNetwork () {
        //for a particular category load the api
        Alamofire.request("https://dummyjson.com/products/category/smartphones", method: .get, encoding: URLEncoding.default, headers: nil).responseJSON { response in
            switch response.result {
                case .success:
                if let productDict: NSDictionary = response.value as! NSDictionary? {
                    print(productDict)
                    
                    let products = productDict["products"] as? [NSDictionary]
                    for product in products! {
                        print(product)
                        let title = product["title"] as! String
                        let description = product["description"] as! String
                        let modelImage = product["thumbnail"] as! String
                        
                        self.productTitleArray.add(title)
                        self.productDescriptionArray.add(description)
                        self.productImageArray.add(modelImage)
                        
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
        
    }    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return productDescriptionArray.count
    }

    var pName: String = ""
    var pDetail: String = ""
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productIdentifier", for: indexPath) as! ProductTableViewCell
        
        let productTitle = (productTitleArray[indexPath.row] as AnyObject) as? String
        let productDescription = (productDescriptionArray[indexPath.row] as AnyObject) as? String
        let productImage = (productImageArray[indexPath.row] as AnyObject) as? String
        cell.productNameLabel.text = productTitle
        cell.productDescriptionLabel.text = productDescription
        cell.imageView?.image = UIImage(named: productImage!)
        
        pName = productTitle!
        pDetail = productDescription!
        
        //adding gesture tap on add to cart image view cell
        let cartTapGesture = UITapGestureRecognizer(target: self, action: #selector(cartImageTapped(sender:)))
        cell.addToCartImage.addGestureRecognizer(cartTapGesture)
        cell.addToCartImage.isUserInteractionEnabled = true
  
        return cell
    }
    
    //MARK: Image Tap Gesture function
    @objc func cartImageTapped(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            print("image tapped")
            //rowSelected(productName: pName, productDetail: pDetail)
        }
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let pTitle = (productTitleArray[indexPath.row] as AnyObject) as! String
        let pData = (productDescriptionArray[indexPath.row] as AnyObject) as! String
        
        DBOperationsManager.dbManagerSharedInstance().insertProductData(name: pTitle, detail: pData)
        let array = DBOperationsManager.dbManagerSharedInstance().fetchProductRecord()
        print(array)
       
      //  rowSelected(productName: pTitle, productDetail: pData)
    }
    /*func rowSelected(productName: String, productDetail: String) {
       DBOperationsManager.dbManagerSharedInstance().insertProductData(name: productName, detail: productDetail)
       let array = DBOperationsManager.dbManagerSharedInstance().fetchProductRecord()
       print(array)
    }*/
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
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