//
//  UIViewController+Extenssions.swift
//  Happy Roads
//
//  Created by Saikumar on 30/10/18.
//  Copyright © 2018 Saikumar. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showAlert(title: String, message: String, onTapOk: @escaping ()-> ()) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { (action) in
            
            onTapOk()
            
        }))
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @objc func goBackFromThis() {
        self.navigationController?.popViewController(animated: true)
    }
    
}
