//
//  Service.swift
//  demoApp
//
//  Created by Adtiya Yadav on 16/12/18.
//  Copyright © 2018 Adtiya Yadav. All rights reserved.
//

import Foundation
import Moya


enum Service {
    
    case fetchPost
    case flickrFetch
}

extension Service : TargetType {
    
    var baseURL: URL {
        
        switch self {
        case .fetchPost:
            
            return URL(string: "http://jsonplaceholder.typicode.com")!
        
        case .flickrFetch :
            
           return URL(string: "https://api.flickr.com/services/rest/?method=flickr.photos.getRecent&api_key=352b0f7c9fffcc0b14abbb602403cd12&format=json&nojsoncallback=1&api_sig=cf97fd44f3ade525cce0c086125be306")!
        }
    }
    
    var path: String {
        
        switch self {
            
        case .fetchPost :
            
           return "/posts"
            
        case .flickrFetch:
            
            return ""
        }
    }
    
    var method: Moya.Method {
        
        switch self {
            
        case .fetchPost:
            
            return .get
 
        case .flickrFetch:
            
           return  .get
        }
    }
    
    var sampleData: Data {
        
        return Data()
    }
    
    var task: Moya.Task {
        
        switch self {
            
        case .fetchPost:
            
          return .requestPlain
            
        case .flickrFetch :
            
          return .requestPlain
        }
    }
    
    var headers: [String : String]? {
    
        return ["Content-Type" : "application/json"]
    }
    
    
    
}
