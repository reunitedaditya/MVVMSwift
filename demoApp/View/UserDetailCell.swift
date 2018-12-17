//
//  UserDetailCellTableViewCell.swift
//  demoApp
//
//  Created by Adtiya Yadav on 16/12/18.
//  Copyright © 2018 Adtiya Yadav. All rights reserved.
//

import UIKit

class UserDetailCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    
    
    var postViewModel : PostsViewModel! {
        
        didSet {
          
            self.title.text = postViewModel.title
            self.subtitle.text = postViewModel.body
            self.selectionStyle = .none
            
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
