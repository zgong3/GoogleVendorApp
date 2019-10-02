//
//  ViewModel.swift
//  GoogleVendorApp
//
//  Created by Consultant on 10/1/19.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation

class ViewModel {
    
    var imagePhoto = [ImagePhotos](){
        didSet {
            self.doUpdate()
        }
    }

    private func doUpdate(){
        let userInfo: [String : ViewModel] = ["ViewModel" : self]
        NotificationCenter.default.post(name: Notification.Name.PhotoNotification, object: nil, userInfo: userInfo)
    }
    
    
    func getImagePhotos(){
        
        NetworkService.shared.fetchPhotos { [weak self] (img) in
            self?.imagePhoto = img
        }
        
    }
    

}
