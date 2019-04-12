//
//  MediaProcession.swift
//  iTunes_Media
//
//  Created by Collins on 4/12/19.
//  Copyright © 2019 Collins. All rights reserved.
//

import UIKit
import JGProgressHUD
import Kingfisher

var myTableView: UITableView!

class MediaProcession: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func make_table(table :  UITableView){
        
        
        
        
        
    }
    
    
    func network_request(){
        
        
        let hud = JGProgressHUD(style: .dark)
        hud.textLabel.text = "Loading art..."
        hud.show(in: self.view)
        
        
        let urlToRequest = "https://rss.itunes.apple.com/api/v1/us/apple-music/coming-soon/all/10/explicit.json"
        var request = URLRequest(url: URL(string: urlToRequest)!)
        request.httpMethod = "GET"
        request.timeoutInterval = 100
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            DispatchQueue.main.async() {
                
                let errorCode = (error as? NSError)?.code
                
                if errorCode == -1001 {
                    
                    
                } else {
                    
                    print("JSON_data")
                    print(NSString(data: data!, encoding: String.Encoding.utf8.rawValue))
                    
                    
                    do{
                        
                        print("Do state..")
                        
                        //created the json decoder
                        let decoder = JSONDecoder()
                        
                        //using the array to put values
                        let feedjson = try decoder.decode(Welcome.self, from: data!)
                        let feeddata = feedjson.feed
                        mediaResults = feeddata.results
                        
                        print("media_results")
                        print(mediaResults)
                        
                        
                        myTableView.reloadData()
                        
                        hud.dismiss()
                    } catch {
                        
                        print("JSON error")
                        
                    }
                    
                }
                
            }
        }
        task.resume()
        
        
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Num: \(indexPath.row)")
        print("Value: \(mediaResults[indexPath.row])")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mediaResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = artistMedia(frame: CGRect(x: 0,y: 0,width: self.view.frame.width,height: 100), title: "Media")
        
        cell.newView.kf.setImage(with: mediaResults[indexPath.row].artworkUrl100)
        cell.contentMode = .scaleAspectFit
        
        cell.artistName.text = mediaResults[indexPath.row].name
        
        cell.albumName.text = mediaResults[indexPath.row].artistName
        
        cell.mediaType.text = mediaResults[indexPath.row].kind.rawValue
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 100 //or whatever you need
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
