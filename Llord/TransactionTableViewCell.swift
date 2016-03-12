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
    
    
    @IBOutlet var dateLabel: UILabel!

    @IBOutlet var amountLabel: UILabel!
    
    @IBOutlet var mainView: UIView!
    
    @IBOutlet var referenceLabel: UILabel!
    @IBOutlet var secondaryView: UIView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    
    func useData( data: Transaction  ) {
        
        mainView.backgroundColor = darkBlue
        
        secondaryView.layer.cornerRadius = 8;
        secondaryView.layer.masksToBounds = true;
        secondaryView.backgroundColor = lightGrey
        
        nameLabel.textColor = white
        referenceLabel.textColor = white
        dateLabel.textColor = white
        addressLabel.textColor = white
        
        
        if (data.direction == "OUT") {
            amountLabel.textColor = red
        } else {
            amountLabel.textColor = green
        }
        
        let amount = "£" + data.amount!
        amountLabel.text = amount
        
        let name = data.firstName! + " " + data.lastName!
        nameLabel.text = name
        referenceLabel.text = data.reference
    
    }

}