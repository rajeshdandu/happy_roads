//
//  HappyRoadsUtilities.swift
//  Happy Roads
//
//  Created by Saikumar on 31/10/18.
//  Copyright © 2018 Saikumar. All rights reserved.
//

import UIKit

enum FontType: String {
    case regular = ""
    case medium = " Medium"
    case bold = " Bold"
}

class HappyRoadsUtilities {
    
    static let shared = HappyRoadsUtilities()
    private init() { }
    
    private var loadingIndicatorView = UIImageView()
    private let imagesArray = [UIImage(named: "1.png")!,
                       UIImage(named: "2.png")!,
                       UIImage(named: "3.png")!,
                       UIImage(named: "4.png")!,
                       UIImage(named: "5.png")!,
                       UIImage(named: "6.png")!,
                       UIImage(named: "7.png")!,
                       UIImage(named: "8.png")!,
                       UIImage(named: "9.png")!,
                       UIImage(named: "10.png")!,
                       UIImage(named: "11.png")!,
                       UIImage(named: "12.png")!,
                       UIImage(named: "13.png")!,
                       UIImage(named: "14.png")!,
                       UIImage(named: "15.png")!,
                       UIImage(named: "16.png")!,
                       UIImage(named: "17.png")!,
                       UIImage(named: "18.png")!]
    
    private let window = UIApplication.shared.keyWindow!
    private var overlayView = UIView()
    
    func startLoading() {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let loadingVC = storyBoard.instantiateViewController(withIdentifier: "LoadingViewController") as! LoadingViewController
        loadingVC.view.frame = window.bounds
        
        loadingIndicatorView = loadingVC.loadingImageview
        loadingIndicatorView.animationImages =  imagesArray
        loadingIndicatorView.animationDuration = 0.6
        loadingIndicatorView.center = overlayView.center
        loadingIndicatorView.contentMode = .scaleAspectFill
        
        overlayView = loadingVC.view
        overlayView.center = window.center
        overlayView.alpha = 0.7
        overlayView.backgroundColor = UIColor.black
        overlayView.addSubview(loadingIndicatorView)
    
        window.addSubview(overlayView)
        window.bringSubviewToFront(overlayView)
        self.loadingIndicatorView.startAnimating()
        UIApplication.shared.beginIgnoringInteractionEvents()

    }
        
    func stopLoading() {
        
        self.loadingIndicatorView.stopAnimating()
        overlayView.removeFromSuperview()
        UIApplication.shared.endIgnoringInteractionEvents()
        
    }
    
    func appFont(type: FontType, size: CGFloat) -> UIFont {
        if let font = UIFont(name: "Helvetica Neue\(type.rawValue)", size: size) {
            return font
        } else {
            return UIFont.systemFont(ofSize: size)
        }
    }
    
    
        
}
