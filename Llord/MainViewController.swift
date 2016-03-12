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
        self.navigationController?.navigationBar.translucent = true
        
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
    
    @IBAction func didPushNotifications(sender: AnyObject) {
    }
    
    @IBAction func didPushPayments(sender: AnyObject) {
        
        let storyboard = UIStoryboard(name: "Payment", bundle: nil)
        let controller = storyboard.instantiateViewControllerWithIdentifier("PaymentRequestsVC") as! PaymentsViewController
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func didPushProperties(sender: AnyObject) {
        let storyboard = UIStoryboard(name: "Property", bundle: nil)
        let controller = storyboard.instantiateViewControllerWithIdentifier("PropertiesVC") as! PropertiesViewController
        
        self.navigationController?.pushViewController(controller, animated: true)

    }
 
    @IBAction func didPushTenants(sender: AnyObject) {
        let storyboard = UIStoryboard(name: "Tenant", bundle: nil)
        let controller = storyboard.instantiateViewControllerWithIdentifier("TenantsVC") as! TenantsViewController
        
        self.navigationController?.pushViewController(controller, animated: true)
        
    }
    
    @IBAction func didPushTransaction(sender: AnyObject) {
    }
    
    @IBAction func didPushOverview(sender: AnyObject) {
        
        
    }
    
}

