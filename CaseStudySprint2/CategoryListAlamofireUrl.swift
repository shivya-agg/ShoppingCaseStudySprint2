//
//  CategoryListAlamofire.swift
//  CaseStudySprint2
//
//  Created by Capgemini-DA226 on 9/26/22.
//

import Foundation
import UIKit
import Alamofire

extension UIViewController {

    func url (categoryValue: String) -> String {
        var httpUrl: String = ""
        switch categoryValue {
            case "smartphones":
                httpUrl = "https://dummyjson.com/products/category/smartphones"
            case "laptops":
                httpUrl = "https://dummyjson.com/products/category/laptops"
            case "fragrances":
                httpUrl = "https://dummyjson.com/products/category/fragrances"
            case "skincare":
                httpUrl = "https://dummyjson.com/products/category/skincare"
            case "groceries":
                httpUrl = "https://dummyjson.com/products/category/groceries"
            case "home-decoration":
                httpUrl = "https://dummyjson.com/products/category/home-decoration"
            case "furniture":
                httpUrl = "https://dummyjson.com/products/category/furniture"
            case "tops":
                httpUrl = "https://dummyjson.com/products/category/tops"
            case "womens-dresses":
                httpUrl = "https://dummyjson.com/products/category/womens-dresses"
            case "womens-shoes":
                httpUrl = "https://dummyjson.com/products/category/womens-shoes"
            case "mens-shirts":
                httpUrl = "https://dummyjson.com/products/category/mens-shirts"
            case "mens-shoes":
                httpUrl = "https://dummyjson.com/products/category/mens-shoes"
            case "mens-watches":
                httpUrl = "https://dummyjson.com/products/category/mens-watches"
            case "womens-watches":
                httpUrl = "https://dummyjson.com/products/category/womens-watches"
            case "womens-bags":
                httpUrl = "https://dummyjson.com/products/category/womens-bags"
            case "womens-jewellery":
                httpUrl = "https://dummyjson.com/products/category/womens-jewellery"
            case "sunglasses":
                httpUrl = "https://dummyjson.com/products/category/sunglasses"
            case "automotive":
                httpUrl = "https://dummyjson.com/products/category/automotive"
            case "motorcycle":
                httpUrl = "https://dummyjson.com/products/category/motorcycle"
            case "lighting":
                httpUrl = "https://dummyjson.com/products/category/lighting"
                
            default:
                httpUrl = "Invalid category name"
        }
        return httpUrl
    
  
    }
}
