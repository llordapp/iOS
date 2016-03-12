//
//  PropertyDetailViewController.swift
//  Llord
//
//  Created by Llord on 11/03/2016.
//  Copyright © 2016 Llord. All rights reserved.
//

import Foundation
import UIKit

class PropertyDetailViewController: UIViewController {
    
    @IBOutlet weak var jaimeButton: UIButton!
    @IBOutlet weak var quyhnButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        jaimeButton.layer.cornerRadius = 8
        jaimeButton.layer.masksToBounds = true
        
        quyhnButton.layer.cornerRadius = 8
        quyhnButton.layer.masksToBounds = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}