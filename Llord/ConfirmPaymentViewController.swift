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
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}