//
//  listViewController.swift
//  GoogleVendorApp
//
//  Created by Consultant on 9/22/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit


class listViewController: UIViewController {

    @IBOutlet weak var listTableView: UITableView!

    var viewModel = ViewModel(){
        didSet{
            
            DispatchQueue.main.async {
                self.listTableView.reloadData()
            }
            
        }
        
        
        
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupList()
        
    }
    
    func setupList(){
        
        NotificationCenter.default.addObserver(forName: Notification.Name.PhotoNotification, object: nil, queue: .main) { (note) in
            guard let userInfo = note.userInfo as? [String: ViewModel] else {return}
            self.viewModel = userInfo["ViewModel"]!
            
        }
        
        
        
        
    }
    
   
    
}


extension listViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.imagePhoto.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: PhotoTableViewCell.identifier, for: indexPath)as! PhotoTableViewCell
     let imagePhoto = viewModel.imagePhoto[indexPath.row]
        
        cell.photo = imagePhoto
        
        return cell
        
        
    }
    
  
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension
    }
    
    
}


