//
//  ViewController.swift
//  swift05 roll view
//
//  Created by Aaron on 16/7/8.
//  Copyright © 2016年 Aaron. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    var interests : [Interest]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //创建模糊层
        let bgView = UIImageView(image: UIImage(named: "blue"))
        bgView.frame = self.view.bounds
        self.view.addSubview(bgView)
        
        let effectView = UIVisualEffectView(frame: self.view.bounds)
        effectView.effect = UIBlurEffect(style: UIBlurEffectStyle.Light)
        self.view.addSubview(effectView)
        //创建collectionView
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSizeMake(300, 400)
        layout.scrollDirection = UICollectionViewScrollDirection.Horizontal
        
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.clearColor()
        self.view.addSubview(collectionView)
        collectionView.registerClass(ZHCollectionViewCell().classForCoder, forCellWithReuseIdentifier: "cell")
//      数据源创建
        interests = [
            Interest(title: "Hello there, i miss u.", featuredImage: UIImage(named: "hello")!),
            Interest(title: "🐳🐳🐳🐳🐳",featuredImage: UIImage(named: "dudu")!),
            Interest(title: "Training like this, #bodyline", featuredImage: UIImage(named: "bodyline")!),
            Interest(title: "I'm hungry, indeed.",  featuredImage: UIImage(named: "wave")!),
            Interest(title: "Dark Varder, #emoji",  featuredImage: UIImage(named: "darkvarder")!),
            Interest(title: "I have no idea, bitch", featuredImage: UIImage(named: "hhhhh")!),]
        
        collectionView .reloadData()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int{
        return 1
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return interests.count
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! ZHCollectionViewCell
        let interest = interests[indexPath.row]
        print(interest.title)
        cell.interest = interest
        
        return cell
    }
}

