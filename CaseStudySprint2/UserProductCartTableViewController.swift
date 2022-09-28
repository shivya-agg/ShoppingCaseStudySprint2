//
//  UserProductCartTableViewController.swift
//  CaseStudySprint2
//
//  Created by Capgemini-DA226 on 9/25/22.
//

import UIKit

//MARK: Class
class ProductCartViewCell: UITableViewCell {
    
    //MARK: IBOutlets
    @IBOutlet weak var cartProductNameLabel: UILabel!
    @IBOutlet weak var cartProductDetailLabel: UILabel!
    @IBOutlet weak var cartCheckoutImage: UIImageView!
}

class UserProductCartTableViewController: UITableViewController {

    
    //MARK: Variables
    var userCartArray = [Product]()
    
    //MARK: Life cycle methods
    override func viewDidLoad() {
        print("load")
        super.viewDidLoad()
        userCartArray = DBOperationsManager.dbManagerSharedInstance().fetchProductRecord()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("didappear")
        super.viewDidAppear(animated)
        userCartArray = DBOperationsManager.dbManagerSharedInstance().fetchProductRecord()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
 
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userCartArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCartIdentifier") as! ProductCartViewCell
        let productsCart = userCartArray[indexPath.row]
        
        cell.cartProductNameLabel.text = productsCart.name
        cell.cartProductDetailLabel.text = productsCart.detail
        
        
        //adding gesture tap on add to cart image view cell
        let checkoutCartTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.checkoutCartImageTapped))
        cell.cartCheckoutImage.addGestureRecognizer(checkoutCartTapGesture)
        cell.cartCheckoutImage.isUserInteractionEnabled = true
        
        return cell
    }
    
    //MARK: Checkout order Image Tap Gesture function
    
    //navigating to checkout view controller once tapped on checkout cart image
    @objc func checkoutCartImageTapped(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            let checkoutOrderViewController = self.storyboard?.instantiateViewController(withIdentifier: "checkoutOrderViewController") as! CheckoutViewController
            self.navigationController?.pushViewController(checkoutOrderViewController, animated: true)
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
