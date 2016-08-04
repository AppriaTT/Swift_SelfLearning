//
//  ViewController.swift
//  Swift
//
//  Created by Aaron on 16/8/4.
//  Copyright © 2016年 Aaron. All rights reserved.
//

import UIKit

extension Array {
    func safeIndex(i: Int) -> Element? {
        return i < self.count && i >= 0 ? self[i] : nil
    }
}

private let reuseIdentifier = "Cell"

class CViewController: UICollectionViewController {
    
    @IBOutlet var testCV:UICollectionView!
    //数组类型映射
    let dataSource = ["1","2","3","4","5"].map{AnimationCellModel(imagePath: $0)}
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        self.collectionView!.registerNib(UINib.init(nibName: String(AnimationCell), bundle: nil), forCellWithReuseIdentifier: String(AnimationCell))
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        collectionView?.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return dataSource.count ?? 0
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCellWithReuseIdentifier(String(AnimationCell), forIndexPath: indexPath) as? AnimationCell, viewModel = dataSource.safeIndex(indexPath.row) else {
            return UICollectionViewCell()
        }
        cell.configCell(viewModel)
        return cell
    }
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        guard let cell = collectionView.cellForItemAtIndexPath(indexPath) as? AnimationCell else {
            return
        }
        
        self.handleAnimationCellSelected(collectionView, cell: cell)
    }
    private func handleAnimationCellSelected(collectionView: UICollectionView, cell: AnimationCell) {
        
        cell.handleCellSelected()
        cell.backButtonTapped = {
            guard let indexPaths = self.collectionView?.indexPathsForSelectedItems() else {
                return
            }
            
            self.collectionView?.scrollEnabled = true
            self.collectionView?.reloadItemsAtIndexPaths(indexPaths)
        }
        
        let animations: () -> () = {
            cell.frame = collectionView.bounds
        }
        
        let completion: (finished: Bool) -> () = { _ in
            collectionView.scrollEnabled = false
        }
        
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: [], animations: animations, completion: completion)
    }
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}
