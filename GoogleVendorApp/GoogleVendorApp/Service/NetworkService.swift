//
//  GoogleAPI.swift
//  GoogleVendorApp
//
//  Created by Consultant on 9/23/19.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation

typealias PhotoHandler = ([ImagePhotos]) -> Void

final class NetworkService {
    static let shared = NetworkService()
    
    private init() {}
    
    func fetchPhotos(completion: @escaping PhotoHandler) {
        let url = "https://jsonplaceholder.typicode.com/photos"
        
        guard let finalURL = URL(string: url) else { return }
        
        print(finalURL)
        
        URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            
            
            if let data = data {
                do {
                    let photoData = try JSONDecoder().decode([ImagePhotos].self, from: data)
                    completion(photoData)
                    
                    
                } catch {
                    print("Error: decoding failed")
                    return
                }
            }
            }.resume()
    }
}
