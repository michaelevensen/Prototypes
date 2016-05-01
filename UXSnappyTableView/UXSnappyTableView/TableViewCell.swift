//
//  TableViewCell.swift
//  UXSnappyTableView
//
//  Created by Michael Nino Evensen on 01/05/16.
//  Copyright © 2016 Michael Nino Evensen. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var contentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
