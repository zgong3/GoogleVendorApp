//
//  PhotoTableViewCell.swift
//  GoogleVendorApp
//
//  Created by Consultant on 9/23/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class PhotoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var listImageID: UILabel!
    
    
    @IBOutlet weak var listImageView: UIImageView!
    
    @IBOutlet weak var listImageTitle: UILabel!
    
    static let identifier = "PhotoTableViewCell"
    
    var photo: ImagePhotos! {
        didSet {
            listImageID.text = "\(photo.id)"
            listImageTitle.text = photo.title
            
            
            photo.getSmallImage { [weak self] (img) in
                self?.listImageView.image = img
            }
        }
    }

}
