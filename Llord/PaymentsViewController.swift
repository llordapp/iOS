//
//  PaymentsViewController.swift
//  Llord
//
//  Created by Llord on 11/03/2016.
//  Copyright © 2016 Llord. All rights reserved.
//

import Foundation
import UIKit

class PaymentsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    var list : [Request] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
        loadModel()
        
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [darkBlue.CGColor, purple.CGColor]
        view.layer.insertSublayer(gradient, atIndex: 0)
        gradient.startPoint = CGPointZero;
        gradient.endPoint = CGPointMake(1, 1);
        
    }
    
    override func viewWillAppear(animated: Bool) {
        self.tableView.contentInset = UIEdgeInsetsMake(55,0,0,0)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadModel() {
        //let path = NSBundle.mainBundle().pathForResource("Requests", ofType: "json")
        LlordClient.sharedInstance().getPaymentRequests() { (success, error, data) in
            if (success) {
                print(data)
                dispatch_async(dispatch_get_main_queue(), {
                    for item in data! {
                        let object = Request(dictionary: item)
                        self.list.append(object)
                    }
                    self.tableView.reloadData()
                })
            }
            
        }
        
        //list = Request.loadPaymentRequestsFromFile(path!)
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("RequestCell", forIndexPath: indexPath) as! PaymentRequestTableViewCell
        let item = list[indexPath.row]
        cell.useData(item)
        cell.selectionStyle = .None
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        //let item = list[indexPath.row]
        
        //let image = LlordClient.sharedInstance().getInvoiceImage(item.image)
        
        let image = UIImage(named: "tenant2")
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier("InvoiceVC") as! InvoiceViewController
        
        controller.invoice = image
        
        self.navigationController?.pushViewController(controller, animated: true)
    
    }
    
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }
    
    func tableView(tableView: UITableView, didHighlightRowAtIndexPath indexPath: NSIndexPath) {
        let cell  = tableView.cellForRowAtIndexPath(indexPath) as! PaymentRequestTableViewCell
        cell.secondaryView.backgroundColor = lightGrey
    }
    
    func tableView(tableView: UITableView, didUnhighlightRowAtIndexPath indexPath: NSIndexPath) {
        let cell  = tableView.cellForRowAtIndexPath(indexPath) as! PaymentRequestTableViewCell
        cell.secondaryView.backgroundColor = lightGrey
    }
    
    func configureUI() {
        
        view.backgroundColor = darkBlue
        tableView.backgroundColor = darkBlue
        
    }

    
    
}