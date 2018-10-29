//
//  LandingViewController.swift
//  Happy Roads
//
//  Created by Saikumar on 28/10/18.
//  Copyright © 2018 Saikumar. All rights reserved.
//

import UIKit

class LandingViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.isHidden = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
 
    }

}
