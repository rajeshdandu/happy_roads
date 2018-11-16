//
//  MenuViewControllerExtension.swift
//  Happy Roads
//
//  Created by brn.developers on 11/16/18.
//  Copyright © 2018 Saikumar. All rights reserved.
//

import UIKit
import SideMenu

extension UIViewController{
    func setUpMenu(viewControllerInstance:UIViewController)
    {
        let menuRightNavigationController = UISideMenuNavigationController(rootViewController: viewControllerInstance)
        SideMenuManager.default.menuRightNavigationController = menuRightNavigationController
        SideMenuManager.default.menuWidth = 3*self.view.frame.width/4
        SideMenuManager.default.menuFadeStatusBar = false
        SideMenuManager.default.menuAddPanGestureToPresent(toView: self.navigationController!.navigationBar)
        SideMenuManager.default.menuAddScreenEdgePanGesturesToPresent(toView: self.navigationController!.view)
        
    }
}
