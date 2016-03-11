//
//  LlordPaymentRequest.swift
//  Llord
//
//  Created by Llord on 11/03/2016.
//  Copyright © 2016 Llord. All rights reserved.
//

import Foundation

class Request {
    
    var id : String?
    var amount : String?
    var address : String?
    var tenantName : String?
    var item : String?
    
    init(dictionary:NSDictionary) {
        id = dictionary["id"] as? String
        amount = dictionary["amount"] as? String
        address = dictionary["address"] as? String
        tenantName = dictionary["tenantName"] as? String
        item = dictionary["item"] as? String
    }
    
    class func loadPaymentRequestsFromFile(path: String) -> [Request] {
        
        var results : [Request] = []
        
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
        
        if let portfolio = json!["requests"] as? [NSDictionary] {
            for dictionary in portfolio {
                let item = Request(dictionary: dictionary)
                results.append(item)
            }
        }
        
        return results
        
    }
    
}