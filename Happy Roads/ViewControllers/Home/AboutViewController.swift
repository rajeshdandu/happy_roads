//
//  AboutViewController.swift
//  Happy Roads
//
//  Created by brn.developers on 11/16/18.
//  Copyright © 2018 Saikumar. All rights reserved.
//

import UIKit
import SideMenu

class AboutViewController: UIViewController {
    var displayImageHolder:UIImage?
    @IBOutlet weak var exploreImageDisplayImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        decorateNavigationBar()
        displayImage()
    }
    func decorateNavigationBar() {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 45))
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.navigationController?.navigationBar.inputView?.addSubview(view)
        self.navigationController?.navigationBar.isTranslucent = false
        
        let logoButton = UIButton(frame: CGRect(x: 0, y: 0, width: 45, height: 30))
        logoButton.setBackgroundImage(#imageLiteral(resourceName: "back_icon"), for: .normal)
        logoButton.addTarget(self, action: #selector(goBackFromThis), for: .touchUpInside)
        let barButton = UIBarButtonItem(customView: logoButton)
        self.navigationItem.leftBarButtonItem = barButton
        
        let menuBarButton = UIBarButtonItem(image: #imageLiteral(resourceName: "menu_icon"), style: .plain, target: self, action: #selector(menuBtnAction))
        menuBarButton.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        self.navigationItem.rightBarButtonItem = menuBarButton
    }
    
    
    @objc func menuBtnAction() {
        setUpSideMenu()
        present(SideMenuManager.default.menuRightNavigationController!, animated: true, completion: nil)
    }
    func setUpSideMenu() {
        
        let menuVC = self.storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
        setUpMenu(viewControllerInstance: menuVC)
    }
    func displayImage()
    {
        exploreImageDisplayImageView.image=displayImageHolder!
        
    }
    
    

   
}
