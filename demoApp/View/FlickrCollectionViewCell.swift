//
//  FlickrCollectionViewCell.swift
//  demoApp
//
//  Created by Adtiya Yadav on 16/12/18.
//  Copyright © 2018 Adtiya Yadav. All rights reserved.
//

import UIKit
import SDWebImage

class FlickrCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var flickrPhotoViewModel : FlickrPhotoViewModel! {
        
        didSet {
            
            self.imageView.sd_setImage(with: URL(string: flickrPhotoViewModel.url), placeholderImage: nil)
        }
    }

}
