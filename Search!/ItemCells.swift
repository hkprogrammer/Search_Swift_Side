//
//  ItemCells.swift
//  Search!
//
//  Created by Hitoki Kidahashi on 4/15/19.
//  Copyright © 2019 Hitoki Kidahashi. All rights reserved.
//

import UIKit

class ItemCells: UITableViewCell {

    
    @IBOutlet var img: UIImageView!
    @IBOutlet var Name: UILabel!
    @IBOutlet var Price: UILabel!
    
    
    
    func setVideo(video: Video){
        img.image = video.image
        Name.text = video.title
        Price.text = video.price
    }
    
    
    
    
    
    
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}
