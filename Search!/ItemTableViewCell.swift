//
//  ItemTableViewCell.swift
//  Search!
//
//  Created by Hitoki Kidahashi on 4/8/19.
//  Copyright © 2019 Hitoki Kidahashi. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    
    
    @IBOutlet var itemName: UILabel!
    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var nameLeble: UITableViewCell!
    
    var items = [Items]()
    
    
  
//    var text1 : String = "Pen Item"
//    itemName.text = text1
//
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
