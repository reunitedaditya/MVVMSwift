//
//  FlickrPhoto.swift
//  demoApp
//
//  Created by Adtiya Yadav on 17/12/18.
//  Copyright © 2018 Adtiya Yadav. All rights reserved.
//

import Foundation

struct FlickrPhoto: Codable {
    let photos: Photos
    let stat: String
}

struct Photos: Codable {
    let page, pages, perpage: Int
    let photo: [Photo]
}

struct Photo: Codable {
    let id, owner, secret, server: String
    let farm: Int
    let title: String
    let ispublic, isfriend, isfamily: Int
}
