//
//  Entities.swift
//  iTunes_Media
//
//  Created by Collins on 4/12/19.
//  Copyright © 2019 Collins. All rights reserved.
//

import Foundation
import UIKit

let iTunes_JSON = Data()
var media_results = [Result]()

class ArtistMedia: UITableViewCell {
    
    var newView: UIImageView!
    var artistname: UILabel!
    var albumname: UILabel!
    var mediatype: UILabel!
    
    init(frame: CGRect, title: String) {
        super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        
        newView = UIImageView(frame: CGRect(x: 0,y: 0,width: 100,height: 100))
        artistname = UILabel(frame: CGRect(x: 120,y: 10,width: 200,height: 25))
        artistname.font = UIFont.boldSystemFont(ofSize: artistname.font.pointSize)
        albumname = UILabel(frame: CGRect(x: 120,y: 35,width: 200,height: 25))
        mediatype = UILabel(frame: CGRect(x: 120,y: 60,width: 200,height: 25))
        addSubview(newView)
        addSubview(artistname)
        addSubview(albumname)
        addSubview(mediatype)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
}
