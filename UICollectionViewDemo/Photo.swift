//
//  Photo.swift
//  UICollectionViewDemo
//
//  Created by Chhaileng Peng on 1/13/19.
//  Copyright © 2019 Chhaileng Peng. All rights reserved.
//

import Foundation

class PhotoCategory {
    var category: String?
    var icon: String?
    var photos: [String]?
    
    init(category: String, icon: String, photos: [String]) {
        self.category = category
        self.icon = icon
        self.photos = photos
    }
    
    static func generatePhotos(prefix: String, count: Int) -> [String] {
        var photos = [String]()
        for i in 1...count {
            photos.append("\(prefix)\(i)")
        }
        return photos
    }
}
