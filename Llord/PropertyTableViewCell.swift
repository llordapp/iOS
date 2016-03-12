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
    

    @IBOutlet var mainView: UIView!
    @IBOutlet var secondaryView: UIView!
    @IBOutlet var propertyImageView: UIImageView!
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var ContractLabel: UILabel!
    @IBOutlet var expiryLabel: UILabel!
    @IBOutlet var numberOfTenantsLabel: UILabel!
    
    func useData( data: Property ) {
        
        mainView.backgroundColor = darkBlue
        
        secondaryView.layer.cornerRadius = 8;
        secondaryView.layer.masksToBounds = true;
        secondaryView.backgroundColor = lightGrey
        
        addressLabel.textColor = white
        ContractLabel.textColor = white
        expiryLabel.textColor = white
        numberOfTenantsLabel.textColor = white
        
        
        let image = UIImage(named: data.imageName!)
        propertyImageView.image = image
        addressLabel.text = data.address
        expiryLabel.text = data.contractEnd
    }
    
}