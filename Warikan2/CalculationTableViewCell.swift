//
//  CalculationTableViewCell.swift
//  Warikan2
//
//  Created by 野崎陽奈子 on 2019/10/05.
//  Copyright © 2019 野崎陽奈子. All rights reserved.
//

import UIKit

class CalculationTableViewCell: UITableViewCell {
    
    @IBOutlet var groupLabel: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var memberLabel: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    @IBAction func up(_ sender: UIButton) {
        if let now = Int(moneyLabel.text!) {
            moneyLabel.text = String(now + 1)
        } else {
            moneyLabel.text = String(1)
        }
    }
    
    @IBAction func down(_ sender: UIButton) {
        if let now = Int(moneyLabel.text!) {
            moneyLabel.text = String(now - 1)
        } else {
            moneyLabel.text = String(1)
        }
    }
    
}
