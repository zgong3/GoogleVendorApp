//
//  MainViewController.swift
//  GoogleVendorApp
//
//  Created by Consultant on 10/1/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var tableViewContainer: UIView!
    
    @IBOutlet weak var collectionViewContainer: UIView!
    
    
    var viewModel = ViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMain()
        
    }
    
    func setupMain(){
        
        viewModel.getImagePhotos()
        
        
    }
    
   
    @IBAction func switchButtonTapped(_ sender: UIButton) {
        
        collectionViewContainer.isHidden.toggle()
        
        tableViewContainer.isHidden.toggle()
        
    }
    

}
