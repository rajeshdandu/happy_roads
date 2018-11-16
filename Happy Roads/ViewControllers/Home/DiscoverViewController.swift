//
//  DiscoverViewController.swift
//  Happy Roads
//
//  Created by brn.developers on 11/15/18.
//  Copyright © 2018 Saikumar. All rights reserved.
//

import UIKit
import SideMenu

class DiscoverViewController: UIViewController {
    let images=[#imageLiteral(resourceName: "splash"),#imageLiteral(resourceName: "placeholder")]
    override func viewDidLoad() {
        super.viewDidLoad()

        decorateNavigationBar()
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
        
        let filterBarButton = UIBarButtonItem(image: #imageLiteral(resourceName: "filter_icon"), style: .plain, target: self, action: #selector(filterBtnAction))
        filterBarButton.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        self.navigationItem.rightBarButtonItems = [menuBarButton,filterBarButton]
    }
    
    
    @objc func menuBtnAction() {
        setUpSideMenu()
        present(SideMenuManager.default.menuRightNavigationController!, animated: true, completion: nil)
    }
    
    @objc func filterBtnAction() {
        setUpFilterSideMenu()
        present(SideMenuManager.default.menuRightNavigationController!, animated: true, completion: nil)
    }
    
    func setUpSideMenu() {
        
        let menuVC = self.storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
        setUpMenu(viewControllerInstance: menuVC)
    }
    
    func setUpFilterSideMenu() {
        
        let filterMenuVC = self.storyboard?.instantiateViewController(withIdentifier: "FilterMenuViewController") as! FilterMenuViewController
        setUpMenu(viewControllerInstance: filterMenuVC)
        
    }

}

extension DiscoverViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "DiscoverTableViewCell", for: indexPath) as! DiscoverTableViewCell
        cell.exploreImageView.image=images[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let aboutVC=self.storyboard?.instantiateViewController(withIdentifier: "AboutViewController") as! AboutViewController
        
            self.navigationController?.pushViewController(aboutVC, animated: true)
        aboutVC.displayImageHolder=images[indexPath.row]
        
    }
    
    
}
