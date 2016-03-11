//
//  LlordTenant.swift
//  Llord
//
//  Created by Llord on 11/03/2016.
//  Copyright © 2016 Llord. All rights reserved.
//


import Foundation

class Tenant {
    
    var id : String?
    var imageName : String?
    var address : String?
    var tenantName : String?
    
    init(dictionary:NSDictionary) {
        id = dictionary["id"] as? String
        imageName = dictionary["imageName"] as? String
        address = dictionary["address"] as? String
        tenantName = dictionary["tenantName"] as? String
    }
    
    class func loadTenantsFromFile(path: String) -> [Tenant] {
        
        var tenants : [Tenant] = []
        
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
        
        if let portfolio = json!["tenants"] as? [NSDictionary] {
            for tenantDictionary in portfolio {
                let tenant = Tenant(dictionary: tenantDictionary)
                tenants.append(tenant)
            }
        }
        
        
        return tenants
        
    }
    
}
