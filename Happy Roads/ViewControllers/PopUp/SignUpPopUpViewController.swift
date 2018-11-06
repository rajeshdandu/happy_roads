//
//  SignUpPopUpViewController.swift
//  Happy Roads
//
//  Created by Saikumar on 06/11/18.
//  Copyright © 2018 Saikumar. All rights reserved.
//

import UIKit
import JVFloatLabeledTextField

class SignUpPopUpViewController: UIViewController {

    @IBOutlet weak var backgroundView: UIView!
    
    
    @IBOutlet weak var nameTextField: JVFloatLabeledTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        backgroundView.addSubview(blurEffectView)
        
        nameTextField.useUnderlineColor()
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func closeBtnAction(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
}
