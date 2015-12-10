//
//  MyCell.swift
//  BoardGameTracker
//
//  Created by Zoran Lazic on 08/12/15.
//  Copyright © 2015 Zoran Lazic. All rights reserved.
//

import UIKit

class MyCell: UITableViewCell {
    
    @IBOutlet weak var boardGameImageView: UIImageView!
    @IBOutlet weak var boardGameName: UILabel!    
    @IBOutlet weak var boardGameRentedLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
