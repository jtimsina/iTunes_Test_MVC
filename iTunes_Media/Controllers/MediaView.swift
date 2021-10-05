//
//  MediaView.swift
//  iTunes_Media
//
//  Created by Collins on 4/12/19.
//  Copyright © 2019 Collins. All rights reserved.
//


import UIKit

class MediaView: MediaProcession {
    
    // pull, commit, push, pull
    // Froy training
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        myTableView = UITableView(frame: CGRect(x: 0, y: 0, width: displayWidth, height: displayHeight - barHeight))
        
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        myTableView.dataSource = self
        myTableView.delegate = self
        myTableView.backgroundColor = UIColor.white
        self.view.addSubview(myTableView)
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            // Attaching the content's edges to the scroll view's edges
            myTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            myTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            myTableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            myTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
            // Satisfying size constraints
            myTableView.widthAnchor.constraint(equalTo: self.view.widthAnchor)
            ])
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        
        network_request()
        
    }
    
    
}

