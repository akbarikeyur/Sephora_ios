//
//  AppModel.swift
//  Cozy Up
//
//  Created by Keyur on 20/07/19.
//  Copyright © 2018 Amisha. All rights reserved.
//
import UIKit


class AppModel: NSObject {
    static let shared = AppModel()
    var allProduct : [ProductModel]!
    var categoryData : CategoryModel!
    var total_cart : Int = 0
}

class CategoryModel : AppModel
{
    var variation_name : String!
    var banner : String!
    var subheader : String!
    var slots : [ProductModel]!
    
    override init(){
        variation_name = ""
        banner = ""
        subheader = ""
        slots = [ProductModel]()
    }
    
    init(dict : [String : Any])
    {
        variation_name = ""
        banner = ""
        subheader = ""
        slots = [ProductModel]()
        
        if let temp = dict["variation_name"] as? String {
            variation_name = temp
        }
        if let temp = dict["banner"] as? String {
            banner = temp
        }
        if let temp = dict["subheader"] as? String {
            subheader = temp
        }
        if let temp = dict["slots"] as? [[String : Any]] {
            for dict in temp {
                slots.append(ProductModel.init(dict: dict))
            }
        }
    }
}

class ProductModel : AppModel
{
    var sale_text : String!
    var rating : String!
    var currency : String!
    var sku : String!
    var product_heading : String!
    var name : String!
    var brand_url : String!
    var inventory : String!
    var image_url : String!
    var price : String!
    var app_exclusive : String!
    var publish_time : String!
    var desc : String!
    var brand : String!
    var variant : String!
    var in_stock : String!
    var under_sale : String!
    var categories : [String]!
    var product_slug : String!
    var new_arrival : String!
    var product_id : String!
    var url : String!
    var bestseller : String!
    var dy_display_price : String!
    var currency_symbol : String!
    var group_id : String!
    var crossed_price : String!
    
    override init(){
        sale_text = ""
        rating = ""
        currency = ""
        sku = ""
        product_heading = ""
        name = ""
        brand_url = ""
        inventory = ""
        image_url = ""
        price = ""
        app_exclusive = ""
        publish_time = ""
        desc = ""
        brand = ""
        variant = ""
        in_stock = ""
        under_sale = ""
        categories = [String]()
        product_slug = ""
        new_arrival = ""
        product_id = ""
        url = ""
        bestseller = ""
        dy_display_price = ""
        currency_symbol = ""
        group_id = ""
        crossed_price = ""
        
    }
    
    init(dict : [String : Any])
    {
        sale_text = ""
        rating = ""
        currency = ""
        sku = ""
        product_heading = ""
        name = ""
        brand_url = ""
        inventory = ""
        image_url = ""
        price = ""
        app_exclusive = ""
        publish_time = ""
        desc = ""
        brand = ""
        variant = ""
        in_stock = ""
        under_sale = ""
        categories = [String]()
        product_slug = ""
        new_arrival = ""
        product_id = ""
        url = ""
        bestseller = ""
        dy_display_price = ""
        currency_symbol = ""
        group_id = ""
        crossed_price = ""
        
        if let temp = dict["sale_text"] as? String {
            sale_text = temp
        }
        if let temp = dict["rating"] as? String {
            rating = temp
        }
        if let temp = dict["currency"] as? String {
            currency = temp
        }
        if let temp = dict["sku"] as? String {
            sku = temp
        }
        if let temp = dict["product_heading"] as? String {
            product_heading = temp
        }
        if let temp = dict["name"] as? String {
            name = temp
        }
        if let temp = dict["brand_url"] as? String {
            brand_url = temp
        }
        if let temp = dict["inventory"] as? String {
            inventory = temp
        }
        if let temp = dict["image_url"] as? String {
            image_url = temp
        }
        if let temp = dict["price"] as? String {
            price = temp
        }
        if let temp = dict["app_exclusive"] as? String {
            app_exclusive = temp
        }
        if let temp = dict["publish_time"] as? String {
            publish_time = temp
        }
        if let temp = dict["description"] as? String {
            desc = temp
        }
        if let temp = dict["brand"] as? String {
            brand = temp
        }
        if let temp = dict["variant"] as? String {
            variant = temp
        }
        if let temp = dict["in_stock"] as? String {
            in_stock = temp
        }
        if let temp = dict["under_sale"] as? String {
            under_sale = temp
        }
        if let temp = dict["categories"] as? [String] {
            categories = temp
        }
        if let temp = dict["product_slug"] as? String {
            product_slug = temp
        }
        if let temp = dict["new_arrival"] as? String {
            new_arrival = temp
        }
        if let temp = dict["product_id"] as? String {
            product_id = temp
        }
        if let temp = dict["url"] as? String {
            url = temp
        }
        if let temp = dict["bestseller"] as? String {
            bestseller = temp
        }
        if let temp = dict["dy_display_price"] as? String {
            dy_display_price = temp
        }
        if let temp = dict["currency_symbol"] as? String {
            currency_symbol = temp
        }
        if let temp = dict["group_id"] as? String {
            group_id = temp
        }
        if let temp = dict["crossed_price"] as? String {
            crossed_price = temp
        }
    }
}
