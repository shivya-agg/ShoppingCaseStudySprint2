//
//  AlamofireNetworkViewController.swift
//  CaseStudySprint2
//
//  Created by Capgemini-DA226 on 9/23/22.
//

import UIKit
import Alamofire

class AlamofireNetworkViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func alamofireJsonData() {
        
        Alamofire.request("https://dummyjson.com/products/categories", method: .post, encoding: URLEncoding.default, headers: nil).responseJSON { response in
            switch response.result {
                case .success:
                if let categoryDict: NSDictionary = response.value as! NSDictionary? {
                    print(categoryDict)
                }
                break
                case .failure(let error):
                    print(error)
            }
        }
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
