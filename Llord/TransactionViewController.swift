//
//  TransactionViewController.swift
//  Llord
//
//  Created by Quynh Tran on 11/03/2016.
//  Copyright © 2016 Quynh. All rights reserved.
//

import UIKit

class TransactionViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
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