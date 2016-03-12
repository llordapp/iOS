//
//  LlordClient.swift
//  Llord
//
//  Created by Quynh Tran on 08/03/2016.
//  Copyright © 2016 Quynh. All rights reserved.
//

import Foundation
class LlordClient: NSObject {
    
    
    func getPaymentRequests(completionHandler: (success: Bool, error: String?, data: [[String : AnyObject]]?) -> Void ) {
        
        let session = NSURLSession.sharedSession()
        let urlString = "http://25.105.222.31:8080/"
        let url = NSURL(string: urlString)!
        let request = NSURLRequest(URL: url)
        
        let task = session.dataTaskWithRequest(request) { (data, response, error) in
         
            guard (error == nil) else {
                completionHandler(success: false, error: "Could not load data", data: nil)
                return
            }
            
            /* GUARD: Was there any data returned? */
            guard let data = data else {
                completionHandler(success: false, error: "Could not load data", data: nil)
                return
            }

            /* Parse the data (i.e. convert the data to JSON and look for values!) */
            let parsedResult: AnyObject!
            do {
                parsedResult = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
                if let dataObject = parsedResult as? [[String : AnyObject]] {
                    completionHandler(success: true, error: nil, data: dataObject)

                }
                
            } catch {
                completionHandler(success: false, error: "Could not load data", data: nil)
                return
            }
            
            //print(parsedResult)
            
        }
        
        task.resume()
        
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