//
//  ViewController.swift
//  Llord
//
//  Created by Llord on 11/03/2016.
//  Copyright © 2016 Llord. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var notificationsButton: UIButton!
    @IBOutlet weak var paymentsButton: UIButton!
    @IBOutlet weak var propertiesButton: UIButton!
    @IBOutlet weak var tenantsButton: UIButton!
    @IBOutlet weak var transactionsButton: UIButton!
    @IBOutlet weak var overviewButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        notificationsButton.layer.cornerRadius = 8
        notificationsButton.layer.masksToBounds = true
        
        paymentsButton.layer.cornerRadius = 8
        paymentsButton.layer.masksToBounds = true

        propertiesButton.layer.cornerRadius = 8
        propertiesButton.layer.masksToBounds = true
        
        tenantsButton.layer.cornerRadius = 8
        tenantsButton.layer.masksToBounds = true
        
        transactionsButton.layer.cornerRadius = 8
        transactionsButton.layer.masksToBounds = true
        
        overviewButton.layer.cornerRadius = 8
        overviewButton.layer.masksToBounds = true
//shadow optionally
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

