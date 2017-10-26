//
//  AFViewController.swift
//  Chapter 2 Project 3
//
//  Created by Greg Delgado on 26/10/2017.
//  Copyright © 2017 Greg Delgado. All rights reserved.
//

import UIKit

class AFViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImage(named: "cat.jpg")!
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height)
        
        let scrollView = UIScrollView(frame: view.bounds)
        scrollView.contentSize = image.size
        scrollView.autoresizingMask = UIViewAutoresizing(rawValue: UIViewAutoresizing.RawValue(UInt8(UIViewAutoresizing.flexibleWidth.rawValue) | UInt8(UIViewAutoresizing.flexibleHeight.rawValue)))
        scrollView.addSubview(imageView)
        
        view.addSubview(scrollView)
    }

}

