//
//  DoneViewController.swift
//  Llord
//
//  Created by Llord on 11/03/2016.
//  Copyright © 2016 Llord. All rights reserved.
//

import Foundation
import UIKit

class DoneViewController: UIViewController {
    
    
    @IBOutlet weak var requestsButton: UIButton!
    @IBOutlet weak var menuButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        requestsButton.layer.cornerRadius = 4
        requestsButton.layer.masksToBounds = true
        menuButton.layer.cornerRadius = 4
        menuButton.layer.masksToBounds = true
        
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