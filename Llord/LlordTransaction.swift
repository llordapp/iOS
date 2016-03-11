//
//  LlordTransaction.swift
//  Llord
//
//  Created by Llord on 11/03/2016.
//  Copyright © 2016 Llord. All rights reserved.
//

import Foundation

class Transaction {
    
    var id : String?
    var amount : String?
    var type : String?
    var subject : String?
    var property : String?
    var tenantName : String?
    var date : String?
    
    init(dictionary:NSDictionary) {
        id = dictionary["id"] as? String
        amount = dictionary["amount"] as? String
        subject = dictionary["subject"] as? String
        property = dictionary["property"] as? String
        tenantName = dictionary["tenantName"] as? String
        date = dictionary["date"] as? String
    }
    
    class func loadTransactionsFromFile(path: String) -> [Transaction] {
        
        var results : [Transaction] = []
        
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
        
        if let portfolio = json!["transactions"] as? [NSDictionary] {
            for dictionary in portfolio {
                let item = Transaction(dictionary: dictionary)
                results.append(item)
            }
        }
        
        
        return results
        
    }
    
}

