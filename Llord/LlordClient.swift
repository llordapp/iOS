//
//  LlordClient.swift
//  Llord
//
//  Created by Quynh Tran on 08/03/2016.
//  Copyright © 2016 Quynh. All rights reserved.
//

import Foundation
class LlordClient: NSObject {
    
    
    
    
    class func sharedInstance() -> LlordClient {
        
        struct Singleton {
            static var sharedInstance = LlordClient()
        }
        
        return Singleton.sharedInstance
    }
    
    
    
    
    
}