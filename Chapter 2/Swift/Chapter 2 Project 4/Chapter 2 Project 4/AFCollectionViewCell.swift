//
//  AFCollectionViewCell.swift
//  Chapter 2 Project 4
//
//  Created by Greg Delgado on 26/10/2017.
//  Copyright © 2017 Greg Delgado. All rights reserved.
//

import UIKit

class AFCollectionViewCell: UICollectionViewCell {

    var textLabel: UILabel!
    var text: String? {
        didSet {
            textLabel.text = text
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.white
        
        textLabel = UILabel(frame: bounds)
        textLabel.textAlignment = .center
        textLabel.font = UIFont.boldSystemFont(ofSize: 20)
        contentView.addSubview(textLabel)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.text = ""
    }
}
