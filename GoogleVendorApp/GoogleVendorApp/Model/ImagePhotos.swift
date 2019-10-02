//
//  imageModel.swift
//  GoogleVendorApp
//
//  Created by Consultant on 9/23/19.
//  Copyright © 2019 mac. All rights reserved.
//
import UIKit


class ImagePhotos: Decodable {
//    let albumID: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String

    
    func getSmallImage(completion: @escaping (UIImage?) -> Void){
        cache.downloadFrom(endpoint: thumbnailUrl) { dat in
            if let data = dat {
                DispatchQueue.main.async {
                    completion(UIImage(data: data))
                    
                }
            }
        }
    }
 
    func getBiggerImage(completion: @escaping (UIImage?) -> Void) {
        cache.downloadFrom(endpoint: url) { dat in
            if let data = dat {
                DispatchQueue.main.async {
                    completion(UIImage(data: data))
                }
            }
        }
    }
}
