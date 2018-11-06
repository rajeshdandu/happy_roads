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

    
    @IBOutlet weak var loginView: UIView!
    
    
    
    @IBOutlet weak var backgroundView: UIView!
    
    
    @IBOutlet weak var nameTextField: JVFloatLabeledTextField!
    
    @IBOutlet weak var mobileTextField: JVFloatLabeledTextField!
    
    @IBOutlet weak var emailTextField: JVFloatLabeledTextField!
    
    @IBOutlet weak var passwordTextField: JVFloatLabeledTextField!
    
    @IBOutlet weak var loginEmailTextField: JVFloatLabeledTextField!
    
    @IBOutlet weak var loginPasswordTextField: JVFloatLabeledTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        loginView.isHidden=true
        designUI()
        onPopBackgroundBlur()
        // Do any additional setup after loading the view.
    }
    func designUI()
    {
        nameTextField.useUnderlineColor()
        mobileTextField.useUnderlineColor()
        emailTextField.useUnderlineColor()
        passwordTextField.useUnderlineColor()
        loginEmailTextField.useUnderlineColor()
        loginPasswordTextField.useUnderlineColor()
    }
    func onPopBackgroundBlur()
    {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        backgroundView.addSubview(blurEffectView)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func loginBtnAction(_ sender: Any) {
        loginView.isHidden=false
    }
    
    @IBAction func signUpBtnAction(_ sender: Any) {
        loginView.isHidden=true
    }
    
    @IBAction func signUpInLoginView(_ sender: Any) {
        loginView.isHidden=true
    }
    
    @IBAction func closeBtnAction(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
}
