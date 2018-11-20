//
//  FilterMenuViewController.swift
//  Happy Roads
//
//  Created by brn.developers on 11/16/18.
//  Copyright © 2018 Saikumar. All rights reserved.
//

import UIKit

class FilterMenuViewController: UIViewController {

    var closeViewImage=#imageLiteral(resourceName: "arrow_sidemenu_up")
    var expandViewImage=#imageLiteral(resourceName: "arrow_sidemenu_down")
    var view1:Bool=false
    var view2:Bool=false
    var view3:Bool=false
    
    @IBOutlet weak var distanceBtn: UIButton!
    @IBOutlet weak var ratingBtn: UIButton!
    @IBOutlet weak var bestTimeToVisitBtn: UIButton!
    @IBOutlet weak var distanceView: UIView!
    @IBOutlet weak var ratingView: UIView!
    @IBOutlet weak var timeToVisitView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       self.hideViews()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.isHidden = true
    }
    func hideViews()
    {
        distanceView.isHidden=true
        ratingView.isHidden=true
        timeToVisitView.isHidden=true
    }
    
    @IBAction func onClickDistanceBtn(_ sender: Any) {
        
        if(view1==false)
        {
            distanceBtn.setImage(closeViewImage, for: .normal)
            distanceView.isHidden=false
            view1.toggle()
        }
        else
        {
            distanceBtn.setImage(expandViewImage, for: .normal)
            distanceView.isHidden=true
            view1.toggle()
        }
        
    }
    
    @IBAction func onClickRatingBtn(_ sender: Any) {
        
        if(view2==false)
        {
            ratingBtn.setImage(closeViewImage, for: .normal)
            ratingView.isHidden=false
            view2.toggle()
        }
        else
        {
            ratingBtn.setImage(expandViewImage, for: .normal)
            ratingView.isHidden=true
            view2.toggle()
        }
    }
    
    @IBAction func onClickBestTimeToVisitBtn(_ sender: Any) {
       
        if(view3==false)
        {
            bestTimeToVisitBtn.setImage(closeViewImage, for: .normal)
            timeToVisitView.isHidden=false
            view3.toggle()
        }
        else
        {
            bestTimeToVisitBtn.setImage(expandViewImage, for: .normal)
            timeToVisitView.isHidden=true
            view3.toggle()
        }
      
    }
    
    
}

