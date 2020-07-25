//
//  CollectionViewController.swift
//  Challenge
//
//  Created by Sahar Hany on 7/25/20.
//  Copyright © 2020 Studying. All rights reserved.
//

import UIKit

private let reuseIdentifier = "cell"

class CollectionViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout {

    var itemSize : CGSize = CGSize(width: 0, height: 0)
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        //paddingCalculation()
        paddingCalculationMethod2()
    }

    func paddingCalculation(){
        
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout  {
            
            let itemsPerRow       : CGFloat = 4
            let padding           : CGFloat = 5
            let totalPadding      : CGFloat = padding * (itemsPerRow - 1)
            let individualPadding : CGFloat = totalPadding / itemsPerRow
            let width  = collectionView.frame.width / (itemsPerRow - individualPadding)
            let height = width
            layout.minimumLineSpacing      = padding
            layout.minimumInteritemSpacing = 0
            itemSize = CGSize(width: width, height: height)
            layout.estimatedItemSize = itemSize
        }
    }
    
    func paddingCalculationMethod2(){
        
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout  {
          
          let itemsPerRow             : CGFloat = 4
          let minimumInteritemSpacing : CGFloat = 3
          let width  = (collectionView.frame.width - (minimumInteritemSpacing * itemsPerRow)) / itemsPerRow
          let height = width
          layout.minimumLineSpacing      = 3
          layout.minimumInteritemSpacing = minimumInteritemSpacing
          itemSize = CGSize(width: width, height: height)
          layout.estimatedItemSize = itemSize
      }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 20
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CustomCollectionViewCell
    
        cell.myTitleLabel.text = "\(indexPath.row + 1)"
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return itemSize
    }
}
