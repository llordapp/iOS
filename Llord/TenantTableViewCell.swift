//
//  TenantTableViewCell.swift
//  Llord
//
//  Created by Llord on 11/03/2016.
//  Copyright © 2016 Llord. All rights reserved.
//

import Foundation

import UIKit
import QuartzCore

class TenantTableViewCell: UITableViewCell {

    @IBOutlet var mainView: UIView!
    
    @IBOutlet var secondaryView: UIView!
    
    @IBOutlet var profileImageView: UIImageView!
    
    @IBOutlet var tenantNameLabel: UILabel!
    
    @IBOutlet var messageButton: UIButton!
    
    @IBOutlet var addressLabel: UILabel!
    
    
    func useData( data: Tenant ) {
        
        mainView.backgroundColor = darkBlue
        
        secondaryView.layer.cornerRadius = 8;
        secondaryView.layer.masksToBounds = true;
        secondaryView.backgroundColor = lightGrey
        
        tenantNameLabel.textColor = white
        addressLabel.textColor = white
        
        messageButton.backgroundColor = blue
        messageButton.layer.cornerRadius = 8;
        messageButton.layer.masksToBounds = true;
        
        profileImageView.layer.cornerRadius = 45
        profileImageView.layer.masksToBounds = true;
        
        let image = UIImage(named: data.imageName!)
        profileImageView.image = image
        tenantNameLabel.text = data.tenantName
        addressLabel.text = data.address
        
    }
    
    
}