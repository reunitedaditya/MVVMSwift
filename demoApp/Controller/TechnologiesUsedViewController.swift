//
//  TechnologiesUsedViewController.swift
//  demoApp
//
//  Created by Adtiya Yadav on 16/12/18.
//  Copyright © 2018 Adtiya Yadav. All rights reserved.
//

import Foundation
import UIKit

class TechnologiesUsedViewController: UITableViewController {
    
    
    let cellId = "techCell"
    
    let technologies = ["Moya" , "SDWebImage" , "Github" , "MVVM" , "Typecode.io"] // Static technologies
    
    override func viewDidLoad() {
        
        setupNavBar()
        setupTableView()
       
    }
    
    
    fileprivate func setupNavBar() {
        navigationItem.title = "Technologies"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = UIColor.rgb(r: 50, g: 199, b: 242)
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    
    fileprivate func setupTableView() {
        tableView.register(TechCellTableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.register(UINib(nibName: "TechCellTableViewCell", bundle: nil), forCellReuseIdentifier: cellId)
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
        tableView.separatorColor = .mainTextBlue
        tableView.backgroundColor = UIColor.rgb(r: 12, g: 47, b: 57)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        tableView.tableFooterView = UIView()
    }

}

//TableView Delegate functions

extension TechnologiesUsedViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return technologies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TechCellTableViewCell
        
         cell.techText.text = technologies[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 50
    }

}
