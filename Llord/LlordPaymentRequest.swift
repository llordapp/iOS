//
//  LlordPaymentRequest.swift
//  Llord
//
//  Created by Llord on 11/03/2016.
//  Copyright © 2016 Llord. All rights reserved.
//

import Foundation

class Request {
    
    var address : String?
    var amount : String?
    var currency : String?
    var firstName : String?
    var id : String?
    var image : String?
    var lastName : String?
    var paidDate : String?
    var reference : String?
    var requestDate_Day : String?
    var requestDate_Month : String?
    var requestDate_Year : String?
    
    
    init(dictionary:NSDictionary) {
        address = dictionary["address"] as? String
        let intAmount = dictionary["amount"] as? Float
        let floatAmount = intAmount!/100
        amount = NSString(format: "%.2f", floatAmount) as String
        id = dictionary["id"] as? String
        image = dictionary["image"] as? String
        lastName = dictionary["lastName"] as? String
        paidDate = dictionary["paidDate"] as? String
        reference = dictionary["reference"] as? String
        currency = dictionary["currency"] as? String
        firstName = dictionary["firstName"] as? String
        requestDate_Day = dictionary["requestDate"]!["dayOfMonth"] as? String
        requestDate_Month = dictionary["requestDate"]!["month"] as? String
        requestDate_Year = dictionary["requestDate"]!["year"] as? String
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
            dispatch_async(dispatch_get_main_queue(), {
            for dictionary in portfolio {
                let item = Request(dictionary: dictionary)
                results.append(item)
            }
            })
        }
        
        return results
        
    }
    
}