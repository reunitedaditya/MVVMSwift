//
//  PostsViewModel.swift
//  demoApp
//
//  Created by Adtiya Yadav on 17/12/18.
//  Copyright © 2018 Adtiya Yadav. All rights reserved.
//

import Foundation
import UIKit

struct PostsViewModel {
    
    let title : String
    let userId : Int
    let id : Int
    let body : String
    let accessoryType : UITableViewCell.AccessoryType
    
    init(post : Post) {
        
        self.title = post.title
        self.userId = post.userId
        self.id = post.id
        self.body = post.body
        
        accessoryType = .disclosureIndicator
        
        
    }
} 
