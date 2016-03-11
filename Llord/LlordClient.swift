//
//  LlordClient.swift
//  Llord
//
//  Created by Quynh Tran on 08/03/2016.
//  Copyright © 2016 Quynh. All rights reserved.
//

import Foundation
class LlordClient: NSObject {
    
    func postInvoice() {
        
        
        
    }
    
    
    func getInvoiceData() {
        
        
    }
    
    
    
    class func sharedInstance() -> LlordClient {
        
        struct Singleton {
            static var sharedInstance = LlordClient()
        }
        
        return Singleton.sharedInstance
    }
    
    
    
    
    
}