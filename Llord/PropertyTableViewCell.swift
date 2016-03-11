//
//  PropertyTableViewCell.swift
//  Llord
//
//  Created by Llord on 11/03/2016.
//  Copyright © 2016 Llord. All rights reserved.
//


import UIKit
import QuartzCore

class PropertyTableViewCell: UITableViewCell {
    
    @IBOutlet var propertyImageView: UIImageView!
    @IBOutlet var rentLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    
    func useProperty( prop: Property ) {
        
        let image = UIImage(named: prop.imageName!)
        propertyImageView.image = image
        rentLabel.text = prop.rent
        addressLabel.text = prop.address
    }
    
}