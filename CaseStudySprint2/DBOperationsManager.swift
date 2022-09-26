//
//  DBOperationsManager.swift
//  CaseStudySprint2
//
//  Created by Capgemini-DA226 on 9/22/22.
//

import Foundation
import CoreData

//MARK: Class
class DBOperationsManager: NSObject {
    class func dbManagerSharedInstance() -> DBOperationsManager {
        struct Singleton {
            static let sharedInstance = DBOperationsManager()
        }
        return Singleton.sharedInstance
    }
    
    //MARK: Functions
    //inserting user data
    func insertUserData(name: String, emailId: String, mobile: String, password: String) -> Bool {
        
        let managedContentObject = AppDelegate.sharedAppDelegateInstance().persistentContainer.viewContext
        
        let customer = UserData(context: managedContentObject)
        customer.name = name
        customer.emailId = emailId
        customer.mobile = mobile
        customer.password = password
        
        do {
            try managedContentObject.save()
            print("Core data insertion successful")
            return true
            
        }catch(let error){
            print(error.localizedDescription)
            return false
        }
    }

    //fetching user data
    func fetchUserRecord() -> [UserData] {
        let manageContent = AppDelegate.sharedAppDelegateInstance().persistentContainer.viewContext
        
        let request: NSFetchRequest<UserData> = UserData.fetchRequest()
        
        request.returnsObjectsAsFaults = false
        do {
            let customerRecordArray = try manageContent.fetch(request)
            return customerRecordArray
        } catch(let error) {
            print(error.localizedDescription)
            fatalError("failed")
        }
    }
    
    
    //inserting product data
    func insertProductData(name: String, detail: String) -> Bool {
        
        let managedContentObject = AppDelegate.sharedAppDelegateInstance().persistentContainer.viewContext
        let product = Product(context: managedContentObject)
        product.name = name
        product.detail = detail
                
        do {
            try managedContentObject.save()
            return true
        } catch(let error){
            print(error.localizedDescription)
            return false
        }
    }

    
    //fetching product data
        func fetchProductRecord() -> [Product] {
            
            let manageContent = AppDelegate.sharedAppDelegateInstance().persistentContainer.viewContext
            let request: NSFetchRequest<Product> = Product.fetchRequest()
            
            request.returnsObjectsAsFaults = false
            do {
                let productRecordArray = try manageContent.fetch(request)
                return productRecordArray
            } catch(let error) {
                print(error.localizedDescription)
                fatalError("failed")
            }
        }
        
}
