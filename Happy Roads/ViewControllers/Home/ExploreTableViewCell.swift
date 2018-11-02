//
//  ExploreTableViewCell.swift
//  Happy Roads
//
//  Created by Saikumar on 30/10/18.
//  Copyright © 2018 Saikumar. All rights reserved.
//

import UIKit

class ExploreTableViewCell: UITableViewCell {

    
    @IBOutlet weak var exploreImageView: UIImageView!
    @IBOutlet weak var exploreTitleLabel: UILabel!
    @IBOutlet weak var selectionButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        exploreImageView.layer.masksToBounds = false
        exploreImageView.layer.shadowColor = UIColor.black.cgColor
        exploreImageView.layer.shadowOpacity = 0.8
        exploreImageView.layer.shadowOffset = CGSize(width: 0, height: -1)
        exploreImageView.layer.shadowRadius = 10
        
    }

}
