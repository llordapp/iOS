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
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadModel() {
        let path = NSBundle.mainBundle().pathForResource("Requests", ofType: "json")
        list = Request.loadPaymentRequestsFromFile(path!)
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
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let viewControllerObejct = self.storyboard?.instantiateViewControllerWithIdentifier("InvoiceVC") as? InvoiceViewController
        self.navigationController?.pushViewController(viewControllerObejct!, animated: true)
        
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }
    
    func configureUI() {
        view.backgroundColor = darkBlue
        tableView.backgroundColor = darkBlue
        
    }

    
    
}