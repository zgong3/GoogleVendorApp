//
//  PhotoCollectionViewCell.swift
//  GoogleVendorApp
//
//  Created by Consultant on 9/23/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var collectionImageView: UIImageView!
    
    @IBOutlet weak var collectionImageID: UILabel!
    
    @IBOutlet weak var collectionImageTitle: UILabel!
    
     static let identifier = "PhotoCollectionViewCell"
    
    var photo: ImagePhotos! {
        didSet {
            collectionImageID.text = "\(photo.id)"
            collectionImageTitle.text = photo.title
            
            photo.getSmallImage { [weak self] (img) in
                self?.collectionImageView.image = img
            }
        }
    }

    
}
