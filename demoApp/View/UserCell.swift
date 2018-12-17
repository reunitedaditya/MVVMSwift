//
//  UserCell.swift
//  demoApp
//
//  Created by Adtiya Yadav on 16/12/18.
//  Copyright © 2018 Adtiya Yadav. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {
    
    @IBOutlet weak var userLabel: UILabel!
    
    //ViewModel Property
    
    var postViewModel : PostsViewModel! {
    
        didSet {
            
            self.accessoryType = postViewModel.accessoryType
        }
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
