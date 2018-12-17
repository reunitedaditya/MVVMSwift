//
//  UserDetailViewController.swift
//  demoApp
//
//  Created by Adtiya Yadav on 16/12/18.
//  Copyright © 2018 Adtiya Yadav. All rights reserved.
//

import Foundation
import UIKit

class UserDetailViewController : UITableViewController {
    
       let cellId = "detailCell"
       var posts : [PostsViewModel]!
       var selectedRowIndex = -1
       var userName : String!
    
    override func viewDidLoad() {
        
        setupTableView()
        self.title = userName
    }
    
    fileprivate func setupTableView() {
        
        tableView.register(UserDetailCell.self, forCellReuseIdentifier: cellId)
        tableView.register(UINib(nibName: "UserDetailCell", bundle: nil), forCellReuseIdentifier: cellId)
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
        tableView.separatorColor = .mainTextBlue
        tableView.backgroundColor = UIColor.rgb(r: 12, g: 47, b: 57)
        tableView.tableFooterView = UIView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        tableView.reloadData()
    }

}

extension UserDetailViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return posts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! UserDetailCell
        
        let post = posts[indexPath.row]
        
        cell.postViewModel = post
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == selectedRowIndex {
            return 160 //Expanded
        }
        return 90 //Not expanded
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if selectedRowIndex == indexPath.row {
            selectedRowIndex = -1
        } else {
            selectedRowIndex = indexPath.row
        }
        tableView.reloadRows(at: [indexPath], with: .automatic)
    
    }

}
