//
//  SPTextfieldExtension.swift
//  SinclairPharma
//
//  Created by Minal Jadhav on 15/06/18.
//  Copyright © 2018 Minal Jadhav. All rights reserved.
//

import UIKit


extension UITextField {
    
    func useUnderlineColor(color: UIColor = UIColor.white) {
        
        self.borderStyle = .none
        self.backgroundColor = .clear
        
        let view = UIView()
        view.backgroundColor = color
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
            
        let leading = NSLayoutConstraint(item: view, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 0)
            
        let trailing = NSLayoutConstraint(item: view, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: 0)
            
        let height = NSLayoutConstraint(item: view, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: 0.5)
            
        let views: [String:Any] = ["view": self, "subview": view]
        let vertical = NSLayoutConstraint.constraints(withVisualFormat: "V:[view]-(<=1)-[subview(==10)]", options: .alignAllCenterX, metrics: nil, views: views)
            
        self.addConstraints([leading, trailing, height])
        self.addConstraints(vertical)
        
    }
    
    func setPlaceholderTextColor(color: UIColor = UIColor.darkText) {
        if let placeholder = self.placeholder {
            self.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: color])
        }
    }
    
}
