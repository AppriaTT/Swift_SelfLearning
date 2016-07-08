//
//  ZHCollectionViewCell.swift
//  swift05 roll view
//
//  Created by Aaron on 16/7/8.
//  Copyright © 2016年 Aaron. All rights reserved.
//

import UIKit
//结构体
//struct interest {
//    let title:String
//    let featuredImage:UIImage!
//}

class Interest: NSObject {
    var title:String = ""
    var featuredImage:UIImage!
    
    init(title:String,featuredImage:UIImage) {
        self.title = title
        self.featuredImage = featuredImage
    }
}


class ZHCollectionViewCell: UICollectionViewCell {
    var interest : Interest!{
        didSet{
            //更新UI
            BgImage.image = interest.featuredImage
            titleL.text = interest.title
            print(titleL.text)
        }
    }
    var BgImage : UIImageView!
    
    var titleL : UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        BgImage = UIImageView()
        titleL = UILabel()
        self.backgroundColor = UIColor.blueColor()  
        self.contentView.addSubview(BgImage)
        self.contentView.addSubview(titleL)
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
        BgImage.frame = self.bounds
        titleL.frame = CGRectMake(0, self.bounds.size.height - 50, self.bounds.size.width, 50)
        print(BgImage.frame,titleL.frame)
        
            }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        BgImage.frame = self.bounds
//        titleL.frame = CGRectMake(0, self.bounds.size.height - 50, self.bounds.size.width, 50)
//
//    }
}
