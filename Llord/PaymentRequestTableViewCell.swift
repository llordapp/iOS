//
//  PaymentRequestsTableViewCell.swift
//  Llord
//
//  Created by Llord on 11/03/2016.
//  Copyright © 2016 Llord. All rights reserved.
//

import Foundation

import UIKit
import QuartzCore

class PaymentRequestTableViewCell: UITableViewCell {
    
    @IBOutlet var mainView: UIView!
    
    @IBOutlet var secondaryView: UIView!
    
    @IBOutlet var amountLabel: UILabel!
    
    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var itemLabel: UILabel!
    
    
    
    func useData( data: Request ) {
        
        mainView.backgroundColor = darkBlue
        
        secondaryView.layer.cornerRadius = 8;
        secondaryView.layer.masksToBounds = true;
        secondaryView.backgroundColor = lightGrey
        
        nameLabel.textColor = white
        itemLabel.textColor = white
        amountLabel.textColor = red
        
        amountLabel.text = data.amount
        nameLabel.text = data.lastName
        itemLabel.text = data.reference
        
        
    }

}