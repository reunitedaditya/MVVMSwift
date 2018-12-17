//
//  FlickerCollectionViewController.swift
//  demoApp
//
//  Created by Adtiya Yadav on 16/12/18.
//  Copyright © 2018 Adtiya Yadav. All rights reserved.
//

import UIKit
import Moya

private let reuseIdentifier = "flickrCell"

class FlickerCollectionViewController: UICollectionViewController {
    
    var userProvider = MoyaProvider<Service>()
    var photos = [FlickrPhoto]()
    var photUrl = [String]()
    
    override func viewDidLoad() {
       
        setupNavBar()
        setupCollectionView()
        
        userProvider.request(.flickrFetch, completion: { (result) in
            
            switch result {
                
            case .success(let response) :
                
             let flickrPhoto = try! JSONDecoder().decode(FlickrPhoto.self, from: response.data)
             
             self.photos = [flickrPhoto]
            
             let element = self.photos[0]
             
             for item in element.photos.photo {
                
                let url = "https://farm\(item.farm).staticflickr.com/\(item.server)/\(item.id)_\(item.secret).jpg"
                
                self.photUrl.append(url)
            }
                
                
            case.failure(let error) :
                print(error)
            }
        })
    }
    
    fileprivate func setupNavBar() {
        navigationItem.title = "Flickr"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = .yellow
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = UIColor.rgb(r: 50, g: 199, b: 242)
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    fileprivate func setupCollectionView(){
        
        collectionView.register(FlickrCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.register(UINib(nibName: "FlickrCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
    }
    
}

extension FlickerCollectionViewController : UICollectionViewDelegateFlowLayout {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 100
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        
        let red = drand48()
        let green = drand48()
        let blue = drand48()
        
        item.backgroundColor = UIColor(displayP3Red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: 1.0)
        
        return item
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let yourWidth = collectionView.bounds.width/2.0
        let yourHeight = yourWidth
        
        return CGSize(width: yourWidth, height: yourHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
       self.navigationController?.pushViewController(FlickerDetailViewController(), animated: true)
    }
}
