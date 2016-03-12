//
//  TenantsViewController.swift
//  Llord
//
//  Created by Llord on 11/03/2016.
//  Copyright © 2016 Llord. All rights reserved.
//

import Foundation
import UIKit

class TenantsViewController: UIViewController {
    
    
    @IBOutlet var tableView: UITableView!
    
    var list : [Tenant] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.contentInset = UIEdgeInsetsMake(55,0,0,0);
        
        configureUI()
        
        loadModel()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadModel() {
        let path = NSBundle.mainBundle().pathForResource("Tenants", ofType: "json")
        list = Tenant.loadTenantsFromFile(path!)
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TenantCell", forIndexPath: indexPath) as! TenantTableViewCell
        let item = list[indexPath.row]
        cell.useData(item)
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let viewControllerObejct = self.storyboard?.instantiateViewControllerWithIdentifier("TenantDetailVC") as? TenantDetailViewController
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