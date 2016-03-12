//
//  TransactionViewController.swift
//  Llord
//
//  Created by Quynh Tran on 11/03/2016.
//  Copyright © 2016 Quynh. All rights reserved.
//

import UIKit

class TransactionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var list : [Transaction] = []
    
    @IBOutlet var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [darkBlue.CGColor, purple.CGColor]
        view.layer.insertSublayer(gradient, atIndex: 0)
        gradient.startPoint = CGPointZero;
        gradient.endPoint = CGPointMake(1, 1);

        view.backgroundColor = darkBlue
        tableView.backgroundColor = darkBlue
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        
        self.tableView.contentInset = UIEdgeInsetsMake(60,0,0,0)
        
        loadModel()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadModel() {
        //let path = NSBundle.mainBundle().pathForResource("Requests", ofType: "json")
        LlordClient.sharedInstance().getTransactions() { (success, error, data) in
            if (success) {
                print(data)
                dispatch_async(dispatch_get_main_queue(), {
                    for item in data! {
                        let object = Transaction(dictionary: item)
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
        let cell = tableView.dequeueReusableCellWithIdentifier("TransactionCell", forIndexPath: indexPath) as! TransactionTableViewCell
        let item = list[indexPath.row]
        cell.useData(item)
        cell.selectionStyle = .None
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }
    
    func tableView(tableView: UITableView, didHighlightRowAtIndexPath indexPath: NSIndexPath) {
        let cell  = tableView.cellForRowAtIndexPath(indexPath) as! TransactionTableViewCell
        cell.secondaryView.backgroundColor = lightGrey
    }
    
    func tableView(tableView: UITableView, didUnhighlightRowAtIndexPath indexPath: NSIndexPath) {
        let cell  = tableView.cellForRowAtIndexPath(indexPath) as! TransactionTableViewCell
        cell.secondaryView.backgroundColor = lightGrey
    }

    
    
    
}