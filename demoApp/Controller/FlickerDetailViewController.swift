//
//  FlickerDetailViewController.swift
//  demoApp
//
//  Created by Adtiya Yadav on 16/12/18.
//  Copyright © 2018 Adtiya Yadav. All rights reserved.
//

import UIKit

class FlickerDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

    fileprivate func setup(){
        
        let detailImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        detailImageView.backgroundColor = .orange
        
       self.view = detailImageView
    }

}
