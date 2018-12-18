//
//  FlickerDetailViewController.swift
//  demoApp
//
//  Created by Adtiya Yadav on 16/12/18.
//  Copyright © 2018 Adtiya Yadav. All rights reserved.
//

import UIKit
import SDWebImage

class FlickerDetailViewController: UIViewController {
    
    var imageURL : String!

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    //Apply image to the imageView

    fileprivate func setup(){
        
        let detailImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        
        detailImageView.contentMode = .scaleAspectFill
        detailImageView.clipsToBounds = true
   
        detailImageView.sd_setImage(with: URL(string: imageURL), placeholderImage: UIImage(named: "placeholder.png"))
        
       self.view = detailImageView
        
       self.navigationItem.largeTitleDisplayMode = .never
    }

}
