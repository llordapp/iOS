//
//  ChooseAccountViewController.swift
//  Llord
//
//  Created by Llord on 11/03/2016.
//  Copyright © 2016 Llord. All rights reserved.
//

import Foundation
import UIKit

class ChooseAccountViewController: UIViewController {
    
    @IBOutlet weak var approveButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        approveButton.layer.cornerRadius = 4
        approveButton.layer.masksToBounds = true
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPushPay(sender: AnyObject) {
        
        var info = [
            "paymentInfoId":"56e39b141c40f29245a06838",
            "expiryDate":"0119",
            "cardNumber":"4263970000005262",
            "type":"VISA",
            "cardHolderName":"Joe Smith",
            "cvn":"123",
            "cvnPresent":"true"
        ]
        
        LlordClient.sharedInstance().postPayment(info) { (success, errorString) in
            
            if (success) {
                
                print("success")
            }
            
        }
        
    }
    
}