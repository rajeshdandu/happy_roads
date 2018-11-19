//
//  FilterMenuViewController.swift
//  Happy Roads
//
//  Created by brn.developers on 11/16/18.
//  Copyright © 2018 Saikumar. All rights reserved.
//

import UIKit

class FilterMenuViewController: UIViewController {

    var rowTitles=["Distance","Rating","Best Time to Visit"]
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.isHidden = true
    }
}

