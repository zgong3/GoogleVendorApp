//
//  CollectionViewController.swift
//  GoogleVendorApp
//
//  Created by Consultant on 9/23/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController {
    
    @IBOutlet weak var collectionViewController: UICollectionView!
    
    var viewModel = ViewModel(){
        didSet{
            
            DispatchQueue.main.async {
                self.collectionViewController.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollection()
        
    }
    
    func setupCollection(){
        
        NotificationCenter.default.addObserver(forName: Notification.Name.PhotoNotification, object: nil, queue: .main) { (note) in
            guard let userInfo = note.userInfo as? [String: ViewModel] else {return}
            self.viewModel = userInfo["ViewModel"]!
            
        }
        
    }

}
extension CollectionViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.imagePhoto.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifier, for: indexPath)as! PhotoCollectionViewCell
        let imagePhoto = viewModel.imagePhoto[indexPath.row]
        
        cell.photo = imagePhoto
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        let height = view.frame.height / 3
        
        let width = view.frame.width
        
        
        
        return CGSize(width: width, height: height)
        
        
    }
}
