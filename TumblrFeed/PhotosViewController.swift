//
//  PhotosViewController.swift
//  TumblrFeed
//
//  Created by Victor Singh on 9/12/18.
//  Copyright © 2018 victor. All rights reserved.
//

//import UIKit
//import AlamofireImage
//
//class PhotosViewController: UIViewController,  UITableViewDataSource, UITableViewDelegate {
//
//    @IBOutlet weak var tableView: UITableView!
//
//    var posts: [[String: Any]] = []
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        tableView.delegate = self
//        tableView.dataSource = self
//
//        // Network request snippet
//        let url = URL(string: "https://api.tumblr.com/v2/blog/humansofnewyork.tumblr.com/posts/photo?api_key=Q6vHoaVm5L1u2ZAW1fqv3Jw48gFzYVg9P0vH0VHl3GVy6quoGV")!
//        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
//        session.configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
//        let task = session.dataTask(with: url) { (data, response, error) in
//            if let error = error {
//                print(error.localizedDescription)
//            } else if let data = data,
//                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
////                print(dataDictionary)
//
//                // TODO: Get the posts and store in posts property
//                let responseDictionary = dataDictionary["response"] as! [String: Any]
//                // Store the returned array of dictionaries in our posts property
//                self.posts = responseDictionary["posts"] as! [[String: Any]]
//                // TODO: Reload the table view
////                print(self.posts)
//                self.tableView.reloadData()
////                print(self.posts)
//            }
//        }
//        task.resume()
//        // Do any additional setup after loading the view.
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return posts.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath as IndexPath) as! PhotoCell
//
//        let post = posts[indexPath.row]
//
//        if let photos = post["photos"] as? [[String: Any]] {
//            // photos is NOT nil, we can use it!
//            // TODO: Get the photo url
//            // 1.
//            let photo = photos[0]
//            // 2.
//            let originalSize = photo["original_size"] as! [String: Any]
//            // 3.
//            let urlString = originalSize["url"] as! String
//            // 4.
//            let url = URL(string: urlString)
//            print(urlString)
////            print(cell.photoImageView, "this is url-------")
//            cell.photoImageView.af_setImage(withURL: url!)
//
//        }
//        // Configure YourCustomCell using the outlets that you've defined.
//
//        return cell
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//}

import UIKit
import AlamofireImage

class PhotosViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var posts: [[String: Any]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // Network request snippet
        let url = URL(string: "https://api.tumblr.com/v2/blog/humansofnewyork.tumblr.com/posts/photo?api_key=Q6vHoaVm5L1u2ZAW1fqv3Jw48gFzYVg9P0vH0VHl3GVy6quoGV")!
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        session.configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data,
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                print(dataDictionary)
                
                // Get the posts and store in posts property
                
                // Get the dictionary from the response key
                let responseDictionary = dataDictionary["response"] as! [String: Any]
                
                // Store the returned array of dictionaries in our posts property
                self.posts = responseDictionary["posts"] as! [[String: Any]]
                
                // Reload the table view
                self.tableView.reloadData()
            }
        }
        task.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath as IndexPath) as! PhotoCell
        
        let post = posts[indexPath.row]
        
        if let photos = post["photos"] as? [[String: Any]] {
            // photos is NOT nil, we can use it!
            
            // 1.
            let photo = photos[0]
            // 2.
            let originalSize = photo["original_size"] as! [String: Any]
            // 3.
            let urlString = originalSize["url"] as! String
            // 4.
            let url = URL(string: urlString)
            
            cell.photoImageView.af_setImage(withURL: url!)
            
        }
        
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    /*
     // MARK: - Navigation
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
