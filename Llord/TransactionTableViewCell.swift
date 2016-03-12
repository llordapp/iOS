//
//  TransactionsTableViewCell.swift
//  Llord
//
//  Created by Llord on 11/03/2016.
//  Copyright © 2016 Llord. All rights reserved.
//

import Foundation

import UIKit
import QuartzCore

class TransactionTableViewCell: UITableViewCell {
    
    
    @IBOutlet var amountLabel: UILabel!
    
    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var referenceLabel: UILabel!
    
    @IBOutlet var mainView: UIView!
    
    @IBOutlet var secondaryView: UIView!
    
    func useData( data: Transaction  ) {
        
        mainView.backgroundColor = darkBlue
        
        secondaryView.layer.cornerRadius = 8;
        secondaryView.layer.masksToBounds = true;
        secondaryView.backgroundColor = lightGrey
        
        nameLabel.textColor = white
        referenceLabel.textColor = white
        
        if (data.direction == "OUT") {
            amountLabel.textColor = red
        } else {
            amountLabel.textColor = green
        }
        
        amountLabel.text = data.amount
        nameLabel.text = data.lastName
        referenceLabel.text = data.reference
    
    }

}