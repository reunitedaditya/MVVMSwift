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

    fileprivate func setup(){
        
        let detailImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        
        
        detailImageView.sd_setImage(with: URL(string: imageURL), placeholderImage: UIImage(named: "placeholder.png"))
        
       self.view = detailImageView
    }

}
