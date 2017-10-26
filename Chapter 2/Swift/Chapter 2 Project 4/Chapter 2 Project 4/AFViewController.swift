//
//  AFViewController.swift
//  Chapter 2 Project 4
//
//  Created by Greg Delgado on 26/10/2017.
//  Copyright © 2017 Greg Delgado. All rights reserved.
//

import UIKit

private let CellIdentifier = "Cell Identifier"

class AFViewController: UICollectionViewController {

    var datesArray = [Date]()
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "h:mm:ss a", options: 0, locale: NSLocale.current)
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let flowLayout = self.collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.minimumInteritemSpacing = 40.0
        flowLayout.minimumLineSpacing = 40.0
        flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10)
        flowLayout.itemSize = CGSize(width: 200, height: 200)
        
        self.collectionView!.register(AFCollectionViewCell.self, forCellWithReuseIdentifier: CellIdentifier)
        self.collectionView?.indicatorStyle = .white
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(userTappedAddButton))
        navigationItem.rightBarButtonItem = addButton
        navigationItem.title = "Our Time Machine"

    }


    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return datesArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier, for: indexPath) as! AFCollectionViewCell
    
        cell.text = dateFormatter.string(from: datesArray[indexPath.item])
    
        return cell
    }

    @objc func userTappedAddButton(sender: Any) {
        collectionView?.performBatchUpdates({
            let newDate = Date()
            datesArray.insert(newDate, at: 0)
            collectionView?.insertItems(at: [IndexPath(item: 0, section: 0)])
        }, completion: nil)
    }
}
