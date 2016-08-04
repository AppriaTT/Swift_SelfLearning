//
//  PatternCell.swift
//  swift21 swipeableCell
//
//  Created by Aaron on 16/8/4.
//  Copyright © 2016年 Aaron. All rights reserved.
//

import UIKit

struct pattern {
    let image: String
    let name: String
}

class PatternCell: UITableViewCell {
    @IBOutlet weak var patternNameLabel: UILabel!
    @IBOutlet weak var patternImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
