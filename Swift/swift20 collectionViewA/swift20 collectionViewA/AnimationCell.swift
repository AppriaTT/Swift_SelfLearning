//
//  AnimationCell.swift
//  swift20 collectionViewA
//
//  Created by Aaron on 16/8/4.
//  Copyright © 2016年 Aaron. All rights reserved.
//

import UIKit
struct AnimationCellModel {
    let imagePath:String
    
    init (imagePath:String?){
        self.imagePath = imagePath ?? ""//若optionalValue非nil时，newValue的值为optionalValue的值，若optionalValue为nil时，newValue的值为value的值
    }
}
class AnimationCell: UICollectionViewCell {
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var animationImageView: UIImageView!
    @IBOutlet weak var animationTextView: UITextView!
    var backButtonTapped: (() ->Void)?
    
    func configCell(viewModel:AnimationCellModel){
        animationImageView.image = UIImage(named: viewModel.imagePath)
        animationTextView.scrollEnabled = false
        backButton.hidden = true
        backButton.addTarget(self, action: Selector("backBtnDidTouch:"), forControlEvents: .TouchUpInside)
    }
    func handleCellSelected() {
        animationTextView.scrollEnabled = false
        backButton.hidden = false
        self.superview?.bringSubviewToFront(self)
    }
    
    func backBtnDidTouch(sender:UIGestureRecognizer){
        backButtonTapped?()
    }
}
