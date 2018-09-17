//
//  PhotoDetailsViewController.swift
//  TumblrFeed
//
//  Created by Victor Singh on 9/17/18.
//  Copyright © 2018 victor. All rights reserved.
//

import UIKit

class PhotoDetailsViewController: UIViewController {

    var post: [String: Any]?

    @IBOutlet weak var backDropImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let photos = post!["photos"] as? [[String: Any]] {
            // photos is NOT nil, we can use it!
            
            // 1.
            let photo = photos[0]
            // 2.
            let originalSize = photo["original_size"] as! [String: Any]
            // 3.
            let urlString = originalSize["url"] as! String
            // 4.
            let url = URL(string: urlString)
            
            backDropImageView.af_setImage(withURL: url!)

        }
        // Do any additional setup after loading the view.
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
