//
//  DiscoverTableViewCell.swift
//  Happy Roads
//
//  Created by brn.developers on 11/15/18.
//  Copyright © 2018 Saikumar. All rights reserved.
//

import UIKit

class DiscoverTableViewCell: UITableViewCell {
    
    @IBOutlet weak var exploreImageView: UIImageView!
    
    @IBOutlet weak var distanceIcon: UIImageView!
    @IBOutlet weak var ratingImageView: UIImageView!
    @IBOutlet weak var shareBtn: UIButton!
    @IBOutlet weak var addToFavouritesBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

}
