//
//  FilterMenuViewController.swift
//  Happy Roads
//
//  Created by brn.developers on 11/16/18.
//  Copyright © 2018 Saikumar. All rights reserved.
//

import UIKit

class FilterMenuViewController: UIViewController {

    @IBOutlet weak var distanceBtn: UIButton!
    
    @IBOutlet weak var ratingBtn: UIButton!
    
    @IBOutlet weak var bestTimeToVisitBtn: UIButton!
    @IBOutlet weak var distanceView: UIView!
    @IBOutlet weak var ratingView: UIView!
    
    var closeViewImage=#imageLiteral(resourceName: "arrow_sidemenu_up")
    var expandViewImage=#imageLiteral(resourceName: "arrow_sidemenu_down")
    
    @IBOutlet weak var timeToVisitView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func onClickDistanceBtn(_ sender: Any) {
        
        
    }
    
    @IBAction func onClickRatingBtn(_ sender: Any) {
       
    }
    
    @IBAction func onClickBestTimeToVisitBtn(_ sender: Any) {
      
    }
    
    
}

