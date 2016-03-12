//
//  InvoiceViewController.swift
//  Llord
//
//  Created by Llord on 11/03/2016.
//  Copyright © 2016 Llord. All rights reserved.
//

import Foundation
import UIKit

class InvoiceViewController: UIViewController {
    
    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var proceedButton: UIButton!
    
    @IBOutlet var invoiceView: UIImageView!
    
    var invoice : UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        chatButton.layer.cornerRadius = 4
        chatButton.layer.masksToBounds = true
        
        proceedButton.layer.cornerRadius = 4
        proceedButton.layer.masksToBounds = true
        
        invoiceView.image = invoice
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}