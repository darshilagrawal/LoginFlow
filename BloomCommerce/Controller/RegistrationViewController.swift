//
//  RegisterViewController.swift
//  BloomCommerce
//
//  Created by Darshil Agrawal on 19/05/21.
//

import UIKit

class RegistrationViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    let finalScreen="finalScreen"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField.underlinedField()
        numberTextField.underlinedField()
        emailTextField.underlinedField()
        passwordTextField.delegate=self
        numberTextField.delegate=self
        emailTextField.delegate=self
        print("Loaded")
        
    }
    

    
    @IBAction func signUpButtonPressed(_ sender: Any) {
        let password=passwordTextField.text ?? ""
        let email=emailTextField.text ?? ""
        let number=numberTextField.text ?? ""
        if(password.isEmpty && email.isEmpty && number.isEmpty){
            Helper.sendAlert("Please Enter all the Fields", vc: self)
        }else{
        performSegue(withIdentifier: finalScreen, sender: self)
        }
        }
}

//MARK:- Text Field Delegate Implementation

extension RegistrationViewController{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension UITextField{
    func underlinedField(){
        self.borderStyle = .none
        self.layoutIfNeeded()
        let border=CALayer()
        let width=CGFloat(2.0)
        border.borderColor=UIColor.darkGray.cgColor
        border.frame=CGRect(x: 0, y: self.frame.size.height-width, width: self.frame.size.width, height: self.frame.size.height)
        border.borderWidth=width
        self.layer.addSublayer(border)
        self.layer.masksToBounds=true
    }
}
