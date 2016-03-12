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
    
    @IBOutlet var border: UILabel!
    
    
    func useData( data: Request ) {
        
        mainView.backgroundColor = darkBlue
        
        secondaryView.layer.cornerRadius = 8;
        secondaryView.layer.masksToBounds = true;
        secondaryView.backgroundColor = lightGrey
        
        
        nameLabel.textColor = white
        itemLabel.textColor = white
        amountLabel.textColor = red
        
        let amount = "£" + data.amount!
        amountLabel.text = amount
        
        let name = data.firstName! + " " + data.lastName!
        nameLabel.text = name
        
        itemLabel.text = data.reference
        
        
    }

}