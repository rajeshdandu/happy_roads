//
//  LoginPopUpViewController.swift
//  Happy Roads
//
//  Created by Saikumar on 07/11/18.
//  Copyright © 2018 Saikumar. All rights reserved.
//

import UIKit
import JVFloatLabeledTextField

class LoginPopUpViewController: UIViewController {

    @IBOutlet weak var backgroundView: UIView!
    
    @IBOutlet weak var emailTextField: JVFloatLabeledTextField!
    @IBOutlet weak var passwordTextField: JVFloatLabeledTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        designUI()
        onPopBackgroundBlur()
    }
    
    func designUI() {
        emailTextField.useUnderlineColor()
        passwordTextField.useUnderlineColor()
    }
    
    func onPopBackgroundBlur() {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        backgroundView.addSubview(blurEffectView)
    }
    
    @IBAction func loginBtnAction(_ sender: Any) {
    }
    
    @IBAction func signUpBtnAction(_ sender: Any) {
        if let vc = self.presentingViewController {
            self.dismiss(animated: true) {
                let signUpPopUpVC = self.storyboard?.instantiateViewController(withIdentifier: "SignUpPopUpViewController") as! SignUpPopUpViewController
                signUpPopUpVC.modalPresentationStyle = .overCurrentContext
                vc.present(signUpPopUpVC, animated: true, completion: nil)
            }
        }
    }
    
    
    @IBAction func closeBtnAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func forgotPasswordButtonAction(_ sender: UIButton) {
    }
    
}
