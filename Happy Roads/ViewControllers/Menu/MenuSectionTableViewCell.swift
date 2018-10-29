//
//  MenuSectionTableViewCell.swift
//  Happy Roads
//
//  Created by Saikumar on 28/10/18.
//  Copyright © 2018 Saikumar. All rights reserved.
//

import UIKit

class MenuSectionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var menuSectionTitleLable: UILabel!
    @IBOutlet weak var menuSectionImageView: UIImageView!
    @IBOutlet weak var menuSectionOpenCloseBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
