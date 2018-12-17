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
    var photoViewModel = [FlickrPhotoViewModel]()
    
    override func viewDidLoad() {
       
        setupNavBar()
        setupCollectionView()
        fetchData()

    }
    
    fileprivate func setupNavBar() {
        
        navigationItem.title = "Flickr"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = UIColor.rgb(r: 50, g: 199, b: 242)
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    fileprivate func setupCollectionView(){
        
        collectionView.register(FlickrCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.register(UINib(nibName: "FlickrCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    //Fetch photo data from service
    
    fileprivate func fetchData(){
        
        userProvider.request(.flickrFetch, completion: { (result) in
            
            switch result {
                
            case .success(let response) :
                
                let flickrPhoto = try! JSONDecoder().decode(FlickrPhoto.self, from: response.data)
            
                self.photos = [flickrPhoto]
                
                let element = self.photos[0]
                
                for item in element.photos.photo {
                    
                    let url = "https://farm\(item.farm).staticflickr.com/\(item.server)/\(item.id)_\(item.secret).jpg"

                    self.photoViewModel.append(FlickrPhotoViewModel(photoUrl: url))
                }
                
                self.collectionView.reloadData()
                
            case.failure(let error) :
                print(error)
            }
        })
    }
    
}

//CollectionView Delegate and Datasource Methods

extension FlickerCollectionViewController : UICollectionViewDelegateFlowLayout {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return photoViewModel.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FlickrCollectionViewCell
      
        let photoViewModel = self.photoViewModel[indexPath.row]
        cell.flickrPhotoViewModel = photoViewModel
        
        return cell
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
        
        
        let controller = FlickerDetailViewController()
        controller.imageURL = self.photoViewModel[indexPath.row].url

       self.navigationController?.pushViewController(controller, animated: true)
    }
}
