//
//  HomeViewController.swift
//  Happy Roads
//
//  Created by Saikumar on 28/10/18.
//  Copyright © 2018 Saikumar. All rights reserved.
//

import UIKit
import RevealingSplashView
import SideMenu
import SVProgressHUD

class HomeViewController: UIViewController {

    @IBOutlet weak var HomeItemsCollectionView: UICollectionView!
    
    let homeItemsImagesArray:[UIImage] = [#imageLiteral(resourceName: "homeOne"), #imageLiteral(resourceName: "homeTwo"), #imageLiteral(resourceName: "homeThree"), #imageLiteral(resourceName: "homeFour"), #imageLiteral(resourceName: "homeFive"), #imageLiteral(resourceName: "homeSix")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.decorateNavigationBar()
        self.addSplashView()
        self.setUpSideMenu()
    }
    
    func decorateNavigationBar() {
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.isHidden = true
        // Adding logo to left bar button item
        let logoImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 35, height: 35))
        logoImageView.image = #imageLiteral(resourceName: "logo_navigation")
        let barButton = UIBarButtonItem(customView: logoImageView)
        self.navigationItem.leftBarButtonItem = barButton
    }
    
    func addSplashView() {
        let revealingSplashView = RevealingSplashView(iconImage:#imageLiteral(resourceName: "user_profile_my_account") , iconInitialSize: CGSize(width: 75, height: 75), backgroundImage: #imageLiteral(resourceName: "splash"))
        revealingSplashView.useCustomIconColor = false
        self.view.addSubview(revealingSplashView)
    
        //Starts animation
        revealingSplashView.startAnimation(){
            self.navigationController?.navigationBar.isHidden = false
        }
    }
    
    func setUpSideMenu() {

        let menuVC = self.storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
        let menuRightNavigationController = UISideMenuNavigationController(rootViewController: menuVC)
        SideMenuManager.default.menuRightNavigationController = menuRightNavigationController
        SideMenuManager.default.menuWidth = 3*self.view.frame.width/4
        SideMenuManager.default.menuFadeStatusBar = false
        SideMenuManager.default.menuAddPanGestureToPresent(toView: self.navigationController!.navigationBar)
        SideMenuManager.default.menuAddScreenEdgePanGesturesToPresent(toView: self.navigationController!.view)

    }
    
    // MARK: - Button Actions
  
    @IBAction func menuBtnAction(_ sender: UIBarButtonItem) {
        present(SideMenuManager.default.menuRightNavigationController!, animated: true, completion: nil)
    }
    
    
}




    // MARK: - CollectionView Delegates & DataSource

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeItemsImagesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeItemsCollectionViewCell", for: indexPath) as! HomeItemsCollectionViewCell
        cell.itemImageView.image = homeItemsImagesArray[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.item == 0 {
            let exploreVC = self.storyboard?.instantiateViewController(withIdentifier: "ExploreViewController") as! ExploreViewController
            self.navigationController?.pushViewController(exploreVC, animated: true)
        } else if indexPath.item == 4 {
            let exploreVC = self.storyboard?.instantiateViewController(withIdentifier: "FindFuelStationsViewController") as! FindFuelStationsViewController
            self.navigationController?.pushViewController(exploreVC, animated: true)
        }
        
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width-6)/2, height: (collectionView.frame.height-8)/3)
    }
    
}
