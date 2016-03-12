//
//  ConfirmPaymentViewController.swift
//  Llord
//
//  Created by Llord on 11/03/2016.
//  Copyright © 2016 Llord. All rights reserved.
//

import Foundation
import UIKit

class ConfirmPaymentViewController: UIViewController {
    
    @IBOutlet weak var proceedButton: UIButton!
    
    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var accountNumberLabel: UILabel!
    
    @IBOutlet var infoLabel: UILabel!
    
    @IBOutlet var refLabel: UILabel!
    
    @IBOutlet var amountLabel: UILabel!
    
    
    var request : Request?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        proceedButton.layer.cornerRadius = 4
        proceedButton.layer.masksToBounds = true

        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [darkBlue.CGColor, purple.CGColor]
        view.layer.insertSublayer(gradient, atIndex: 0)
        gradient.startPoint = CGPointZero;
        gradient.endPoint = CGPointMake(1, 1);

        let name = request!.firstName! + " " + request!.lastName!
        nameLabel.text = name
        
        accountNumberLabel.text = "Invoice: #2105420"
        infoLabel.text = request!.address
        
        amountLabel.text = request!.amount
        
        refLabel.text = "Ref: " + request!.reference!
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func didPushConfirm(sender: AnyObject) {
        
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier("ChooseVC") as! ChooseAccountViewController
        controller.request = self.request
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
}