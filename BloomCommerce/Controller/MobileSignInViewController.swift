//
//  MobileSignInViewController.swift
//  BloomCommerce
//
//  Created by Darshil Agrawal on 20/05/21.
//

import UIKit

class MobileSignInViewController: UIViewController {

    @IBOutlet weak var mobileTextField: UITextField!
    let emailSignInSegue="emailSignInSegue"
    let OTPSegue="OTPSegue"
    let signUpSegue="signUpSegue"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden=true
        self.navigationController?.interactivePopGestureRecognizer?.delegate=nil
        mobileTextField.underlinedField()
        mobileTextField.keyboardType = .phonePad
        
    }
    
    @IBAction func signInButtonTapped(_ sender: UIButton) {
        if let mobile=mobileTextField.text{
            if mobile==""{
//                let alert=UIAlertController(title: "Enter Number", message: "Please Enter Mobile Number", preferredStyle: .alert)
//                let dismissAction=UIAlertAction(title: "Retry", style: .default, handler: nil)
//                alert.addAction(dismissAction)
//                self.present(alert, animated: true, completion: nil)
                Helper.sendAlert("Please Enter Mobile Number", vc: self)
            }else{
                performSegue(withIdentifier: OTPSegue, sender: self)

        }
        
    }
    }
    
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        
//        self.navigationController?.pushViewController( RegisterViewController(), animated: true)
    performSegue(withIdentifier: signUpSegue, sender: self)
    }
    @IBAction func loginWithPasswordButtonTapped(_ sender: UIButton) {
//        self.navigationController?.pushViewController(SignInViewController(), animated: true)
    performSegue(withIdentifier: emailSignInSegue, sender: self)
    }
}
