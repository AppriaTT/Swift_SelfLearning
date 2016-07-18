//
//  ViewCell.swift
//  swift16 slideMenu
//
//  Created by Aaron on 16/7/18.
//  Copyright © 2016年 Aaron. All rights reserved.
//

import UIKit

class ViewCell: UITableViewCell {
    @IBOutlet weak var bgView: UIImageView!
    
    @IBOutlet weak var iconImg: UIImageView!
    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet weak var postAuthor: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        iconImg.layer.cornerRadius = iconImg.bounds.size.width / 2.0
        iconImg.layer.masksToBounds = true
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
