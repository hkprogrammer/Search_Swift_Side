//
//  DetailedViewController.swift
//  Search!
//
//  Created by Hitoki Kidahashi on 5/3/19.
//  Copyright © 2019 Hitoki Kidahashi. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {

    
    @IBOutlet var videoImage: UIImageView!
    @IBOutlet var videoName: UILabel!
    @IBOutlet var videoPrice: UILabel!
    
    var video: Video?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        // Do any additional setup after loading the view.
    }
    func setUI(){
        videoImage.image = video?.image
        videoName.text = video?.title
        videoPrice.text = video?.price
        
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
