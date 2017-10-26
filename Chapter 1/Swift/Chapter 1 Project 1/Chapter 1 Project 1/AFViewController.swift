//
//  AFViewController.swift
//  Chapter 1 Project 1
//
//  Created by Greg Delgado on 26/10/2017.
//  Copyright © 2017 Greg Delgado. All rights reserved.
//

import UIKit

private let kCellIdentifier = "Cell Identifier"

class AFViewController: UICollectionViewController {

    var colorArray = [UIColor]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: kCellIdentifier)

        let numberOfColors = 100;
        
        var tempArray = [UIColor]()
        
        for _ in 0..<numberOfColors {
            let redValue = Double(arc4random() % 255) / 255.0
            let blueValue = Double(arc4random() % 255) / 255.0
            let greenValue = Double(arc4random() % 255) / 255.0
            
            tempArray.append(UIColor.init(red: CGFloat(redValue), green: CGFloat(greenValue), blue: CGFloat(blueValue), alpha: 1.0))
        }
        
        colorArray = tempArray
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return colorArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kCellIdentifier, for: indexPath)
    
        cell.backgroundColor = colorArray[indexPath.item]
    
        return cell
    }

}
