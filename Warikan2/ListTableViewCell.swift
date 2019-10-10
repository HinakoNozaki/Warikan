//
//  ListTableViewCell.swift
//  Warikan2
//
//  Created by 野崎陽奈子 on 2019/10/04.
//  Copyright © 2019 野崎陽奈子. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet var groupLabel: UILabel!
    @IBOutlet var memberLabel: UILabel!
    @IBOutlet var ratioLabel: UILabel!
    
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
