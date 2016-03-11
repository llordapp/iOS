//
//  Property.swift
//  TableWithJSONApp
//
//  Created by Llord on 11/03/2016.
//  Copyright © 2016 Llord. All rights reserved.
//

import Foundation

class Property {
    
    var id : String?
    var imageName : String?
    var address : String?
    var contractEnd : String?
    var rent : String?
    
    init(dictionary:NSDictionary) {
        id = dictionary["id"] as? String
        imageName = dictionary["imageName"] as? String
        address = dictionary["address"] as? String
        contractEnd = dictionary["contractEnd"] as? String
        rent = dictionary["rent"] as? String
    }
    
    class func loadPropertiesFromFile(path: String) -> [Property] {
        
        var properties : [Property] = []
        
        var error:NSError? = nil
        var data : NSData?
        
        do {
            data = try NSData(contentsOfFile: path, options:[])
        } catch {
            print(error)
        }
        
        var json : NSDictionary?
        
        do {
            json = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as? NSDictionary
        } catch {
            print(error)
        }
        
        if let portfolio = json!["portfolio"] as? [NSDictionary] {
            for propertyDictionary in portfolio {
                let property = Property(dictionary: propertyDictionary)
                properties.append(property)
            }
        }
        
        
        return properties
        
    }
    
}