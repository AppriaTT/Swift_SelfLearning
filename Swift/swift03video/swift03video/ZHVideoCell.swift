//
//  ZHVideoCell.swift
//  swift03video
//
//  Created by Aaron on 16/7/7.
//  Copyright © 2016年 Aaron. All rights reserved.
//

import UIKit
protocol zhVideoCellDelegate {
    func zhVideoCellDidClicked(videoCell:ZHVideoCell)
}

struct zhVideo {
    let image:String
    let title:String
    let source:String
}
class ZHVideoCell: UITableViewCell {
    var videoScreenshot = UIImageView()
    var videoTitleL = UILabel()
    var videoSourceL = UILabel()
    var playBtn = UIButton()
    
    var delegate: zhVideoCellDelegate?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        self.contentView.addSubview(videoScreenshot)
        self.contentView.addSubview(videoSourceL)
        self.contentView.addSubview(videoTitleL)
        self.contentView.addSubview(playBtn)
        videoTitleL.textColor = UIColor.whiteColor()
        videoSourceL.textColor = UIColor.whiteColor()
        
        playBtn.setImage(UIImage(named: "playBtn"), forState: UIControlState.Normal)
        playBtn.addTarget(self, action: "playBtnClicked", forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    func setupData(videoModel:zhVideo){
        videoScreenshot.image = UIImage(named: videoModel.image)
        videoTitleL.text = videoModel.title
        videoTitleL.textAlignment = NSTextAlignment.Center
        videoSourceL.text = videoModel.source
        videoSourceL.textAlignment = NSTextAlignment.Center
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func layoutSubviews() {
        videoScreenshot.frame = self.contentView.bounds
        playBtn.frame = CGRectMake((self.contentView.bounds.width - 50) / 2.0, (self.contentView.bounds.height - 50)/2.0, 50, 50)
        videoTitleL.frame = CGRectMake((self.contentView.bounds.width - 150) / 2.0, CGRectGetMaxY(playBtn.frame)+5, 150, 20)
        videoSourceL.frame  = CGRectMake((self.contentView.bounds.width - 150) / 2.0,CGRectGetMaxY(videoTitleL.frame), 150, 20)

    }
    
    func playBtnClicked(){
        self.delegate?.zhVideoCellDidClicked(self)
    }
}
