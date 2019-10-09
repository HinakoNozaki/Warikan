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
    
    var upClosure: ((String)->Void)?
    var downClosure: ((String)->Void)?
     //var closure = { (num1: Int) -> Int in return num1}

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    //let closure = { print("クロージャテスト") }
    
    @IBAction func up(_ sender: UIButton) {
        if let now = Int(moneyLabel.text!) {
            moneyLabel.text = String(now + 1)
            upClosure?(memberLabel.text!)
            //print(closure?(memberLabel.text!) as Any)
        } else {
            moneyLabel.text = String(1)
        }
    }
    
    @IBAction func down(_ sender: UIButton) {
        if let now = Int(moneyLabel.text!) {
            moneyLabel.text = String(now - 1)
            downClosure?(memberLabel.text!)
        } else {
            moneyLabel.text = String(1)
        }
    }
    
}
