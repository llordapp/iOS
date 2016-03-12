//
//  LlordClient.swift
//  Llord
//
//  Created by Quynh Tran on 08/03/2016.
//  Copyright © 2016 Quynh. All rights reserved.
//

import UIKit
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
    
    func postPayment(info: [String : AnyObject], completionHandler: (success: Bool, errorString: String?) ->Void ) {
        
        let session = NSURLSession.sharedSession()
        let urlString = "http://25.133.135.203:8080/payment-request"
        let url = NSURL(string: urlString)!
        let request = NSMutableURLRequest(URL: url)

        request.HTTPMethod = "POST"
        
        let httpbodyString = "{\"paymentInfoId\": \"\(info["paymentInfoId"]!)\", \"expiryDate\": \"\(info["expiryDate"]!)\", \"cardNumber\": \"\(info["cardNumber"]!)\",\"type\": \"\(info["type"]!)\", \"cardHolderName\": \"\(info["cardHolderName"]!)\",\"cvn\": \(info["cvn"]!), \"cvnPresent\": \(info["cvnPresent"]!)}"
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        request.HTTPBody = httpbodyString.dataUsingEncoding(NSUTF8StringEncoding)
        
        let task = session.dataTaskWithRequest(request) { data, response, error in
            if error != nil { // Handle error…
                completionHandler(success: false, errorString: "error in posting payment")
                return
            }
            
            print(NSString(data: data!, encoding: NSUTF8StringEncoding)!)
            completionHandler(success: true, errorString: nil)
        }
        task.resume()
        
    }
    
    func getInvoiceImage(imageName: String!) -> UIImage? {
        
        let session = NSURLSession.sharedSession()
        let urlString = "http://25.105.222.31:8080/image/" + imageName
        
        let imageURL = NSURL(string: urlString)
        if let imageData = NSData(contentsOfURL: imageURL!) {
                
            let image = UIImage(data: imageData)
            return image

        }
        
        return UIImage()
        
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