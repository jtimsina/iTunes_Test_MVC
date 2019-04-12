//
//  Entities.swift
//  iTunes_Media
//
//  Created by Collins on 4/12/19.
//  Copyright © 2019 Collins. All rights reserved.
//

import Foundation
import UIKit

let itunesJson = Data()
var mediaResults = [Result]()

class artistMedia: UITableViewCell {
    
    var newView: UIImageView!
    var artistName: UILabel!
    var albumName: UILabel!
    var mediaType: UILabel!
    
    init(frame: CGRect, title: String) {
        super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        
        newView = UIImageView(frame: CGRect(x: 0,y: 0,width: 100,height: 100))
        artistName = UILabel(frame: CGRect(x: 120,y: 10,width: 200,height: 25))
        artistName.font = UIFont.boldSystemFont(ofSize: artistName.font.pointSize)
        albumName = UILabel(frame: CGRect(x: 120,y: 35,width: 200,height: 25))
        mediaType = UILabel(frame: CGRect(x: 120,y: 60,width: 200,height: 25))
        addSubview(newView)
        addSubview(artistName)
        addSubview(albumName)
        addSubview(mediaType)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
}
