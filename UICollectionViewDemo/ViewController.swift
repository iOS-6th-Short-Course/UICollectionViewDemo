//
//  ViewController.swift
//  UICollectionViewDemo
//
//  Created by Chhaileng Peng on 1/13/19.
//  Copyright © 2019 Chhaileng Peng. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let catPhotos = PhotoCategory.generatePhotos(prefix: "cat", count: 16)
    let dogPhotos = PhotoCategory.generatePhotos(prefix: "dog", count: 7)
    
    var photoCategories = [PhotoCategory]()
    
    @IBOutlet weak var photoCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoCategories.append(PhotoCategory(category: "Cat 😸", icon: "cat", photos: self.catPhotos))
        photoCategories.append(PhotoCategory(category: "Dog 🐶", icon: "dog", photos: self.catPhotos))
        photoCategories.append(PhotoCategory(category: "Cat 😸", icon: "cat", photos: self.catPhotos))
        photoCategories.append(PhotoCategory(category: "Dog 🐶", icon: "dog", photos: self.catPhotos))
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return photoCategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoCategories[section].photos!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotoCollectionViewCell
        cell.imageView.image = UIImage(named: photoCategories[indexPath.section].photos![indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = view.bounds.width / 3
        return CGSize(width: itemWidth, height: itemWidth + (itemWidth * 0.25))
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        print(kind)
        if kind == "UICollectionElementKindSectionHeader" {
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as! UICollectionHeaderView
            view.label.text = photoCategories[indexPath.section].category
            return view
        } else {
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "footer", for: indexPath) as! UICollectionFooterView
            view.imageView.image = UIImage(named: photoCategories[indexPath.section].icon!)
            return view
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }

}

