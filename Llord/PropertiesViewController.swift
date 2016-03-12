//
//  PropertiesViewController.swift
//  Llord
//
//  Created by Llord on 11/03/2016.
//  Copyright © 2016 Llord. All rights reserved.
//

import Foundation
import UIKit

class PropertiesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var list : [Property] = []
    
    @IBOutlet var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.contentInset = UIEdgeInsetsMake(55,0,0,0);
        
        self.configureUIForProperties()
        
        loadModel()
        
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [darkBlue.CGColor, purple.CGColor]
        view.layer.insertSublayer(gradient, atIndex: 0)
        gradient.startPoint = CGPointZero;
        gradient.endPoint = CGPointMake(1, 1);
    }
    
    func loadModel() {
        let path = NSBundle.mainBundle().pathForResource("Properties", ofType: "json")
        list = Property.loadPropertiesFromFile(path!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PropertyCell", forIndexPath: indexPath) as! PropertyTableViewCell
        let item = list[indexPath.row]
        cell.useData(item)
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let viewControllerObejct = self.storyboard?.instantiateViewControllerWithIdentifier("PropertyDetailVC") as? PropertyDetailViewController
        self.navigationController?.pushViewController(viewControllerObejct!, animated: true)
        
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }
    
    func configureUIForProperties() {
        
        
        view.backgroundColor = darkBlue
        tableView.backgroundColor = darkBlue
        
    }
    
    
}