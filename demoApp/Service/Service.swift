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
}

extension Service : TargetType {
    
    var baseURL: URL {
        
        return URL(string: "http://jsonplaceholder.typicode.com")!
    }
    
    var path: String {
        
        switch self {
            
        case .fetchPost :
            
           return "/posts"
        }
    }
    
    var method: Moya.Method {
        
        switch self {
        case .fetchPost:
            
            return .get
 
        }
    }
    
    var sampleData: Data {
        
        return Data()
    }
    
    var task: Moya.Task {
        
        switch self {
            
        case .fetchPost:
            
          return .requestPlain
        }
    }
    
    var headers: [String : String]? {
    
        return ["Content-Type" : "application/json"]
    }
    
    
    
}
