//
//  ViewController.swift
//  BloomCommerce
//
//  Created by Darshil Agrawal on 19/05/21.
//

import UIKit

class SignInViewController: UIViewController, UITextFieldDelegate {
    let signInToSignUp="signInToSignUp"
    @IBOutlet weak var displayImage: UIImageView!
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    let finalScreen="finalScreen"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        usernameTextField.underlinedField()
        passwordTextField.underlinedField()
        usernameTextField.delegate=self
        passwordTextField.delegate=self
    }

    @IBAction func signInButtonTapped(_ sender: UIButton) {
        let username=usernameTextField.text ?? ""
        let password=passwordTextField.text ?? ""
        if username.isEmpty || password.isEmpty{
            Helper.sendAlert("Enter Both Username and Password", vc: self)
        } else {
            performSegue(withIdentifier: finalScreen, sender: self)
        }
        
    }
    
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: signInToSignUp, sender: self)
    }
}

//MARK:- Text Field Delegate
extension SignInViewController {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

