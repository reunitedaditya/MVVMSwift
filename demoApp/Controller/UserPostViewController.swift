//
//  UserPostViewController.swift
//  demoApp
//
//  Created by Adtiya Yadav on 16/12/18.
//  Copyright © 2018 Adtiya Yadav. All rights reserved.
//

import Foundation
import UIKit
import Moya

class UserPostViewController : UITableViewController {
    
    let cellId = "postCell"
    var userProvider = MoyaProvider<Service>()
    var postViewModels = [PostsViewModel]()
    var numberOfUsers = [String]()
 
    
    override func viewDidLoad() {
        
        setupNavBar()
        setupTableView()
        fetchData()

    }
    
    
    //Setup the navigation bar
    
    fileprivate func setupNavBar() {
        
        navigationItem.title = "Posts"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = UIColor.rgb(r: 50, g: 199, b: 242)
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    
    //Setup the tableView
    
    fileprivate func setupTableView() {
        tableView.register(UserCell.self, forCellReuseIdentifier: cellId)
        tableView.register(UINib(nibName: "UserCell", bundle: nil), forCellReuseIdentifier: cellId)
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
        tableView.separatorColor = .mainTextBlue
        tableView.backgroundColor = UIColor.rgb(r: 12, g: 47, b: 57)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        tableView.tableFooterView = UIView()
    }
    
    
    // Fetch post data from the Service
    
    fileprivate func fetchData(){
        
        userProvider.request(.fetchPost, completion: { (result) in
            
            switch result {
                
            case .success(let response) :
                
                let post = try! JSONDecoder().decode([Post].self , from : response.data)
                self.postViewModels = post.map({return PostsViewModel(post: $0)})
                
                for post in self.postViewModels {
                    
                    if !self.numberOfUsers.contains(String(post.userId)){
                        
                        self.numberOfUsers.append(String(post.userId))
                    }
                    
                }
                
                self.tableView.reloadData()
                
                
            case.failure(let error) :
                print(error)
            }
        })
    }
}

//TableView Delegate and Datasource Methods

extension UserPostViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return numberOfUsers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! UserCell
        cell.selectionStyle = .none
        cell.userLabel.text = "User \(numberOfUsers[indexPath.row])"
        let post = postViewModels[indexPath.row]
        cell.postViewModel = post

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 70
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let CurrentuserId = numberOfUsers[indexPath.row]
        var allPosts = [PostsViewModel]()
 
            for post in self.postViewModels {
                
                if post.userId == Int(CurrentuserId) {
                    
                    allPosts.append(post)
                }
            }

        let controller = UserDetailViewController()
        controller.posts = allPosts
        controller.userName = "User \(numberOfUsers[indexPath.row])"

        self.navigationController?.pushViewController(controller, animated: true)
       
    }
}

//Navbar setting

class CustomNavigationController: UINavigationController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

//UIColor extenstion to except rgb  values

extension UIColor {
    
    static let mainTextBlue = UIColor.rgb(r: 7, g: 71, b: 89)
    static let highlightColor = UIColor.rgb(r: 50, g: 199, b: 242)
    
    static func rgb(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}
