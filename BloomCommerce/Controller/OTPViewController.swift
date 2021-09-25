//
//  OTPViewController.swift
//  BloomCommerce
//
//  Created by Darshil Agrawal on 19/05/21.
//

import UIKit

class OTPViewController: UIViewController {

    
    @IBOutlet weak var otpField1: UITextField!
    
    @IBOutlet weak var otpField2: UITextField!
    
    @IBOutlet weak var otpField3: UITextField!
    
    @IBOutlet weak var otpField4: UITextField!
    
    let finalScreen="finalScreen"
    override func viewDidLoad() {
        super.viewDidLoad()
        otpField1.underlinedField()
        otpField2.underlinedField()
        otpField3.underlinedField()
        otpField4.underlinedField()
        let tapGesture=UITapGestureRecognizer(target: self, action: #selector(self.resignKeyboard(_:)))
        self.view.addGestureRecognizer(tapGesture)
        

        otpField1.addTarget(self, action: #selector(self.changeTextField(textField:)), for: UIControl.Event.editingChanged)
        otpField2.addTarget(self, action: #selector(self.changeTextField(textField:)), for: UIControl.Event.editingChanged)
        otpField3.addTarget(self, action: #selector(self.changeTextField(textField:)), for: UIControl.Event.editingChanged)
        otpField4.addTarget(self, action: #selector(self.changeTextField(textField:)), for: UIControl.Event.editingChanged)
        otpField1.becomeFirstResponder()
    }
    
    @objc func resignKeyboard(_ sender:UITapGestureRecognizer){
        self.view.endEditing(true)
    }

    @IBAction func verifyButtonTapped(_ sender: UIButton) {
        let otpField1 = otpField1.text!
        let otpField2 = otpField2.text!
        let otpField3 = otpField3.text!
        let otpField4 = otpField4.text!
        let otpFieldFinal=otpField1+otpField2+otpField3+otpField4
        if otpFieldFinal.count==4{
            performSegue(withIdentifier: finalScreen, sender: self)
        }else{
            Helper.sendAlert("Enter All The Values of the OTP", vc: self)
        }
        
        
        
    }
    
    @objc func changeTextField(textField:UITextField){
        let text=textField.text
        if text?.utf16.count == 1 {
            switch textField {
            case otpField1:
                otpField2.becomeFirstResponder()
                break
                
            case otpField2:
                otpField3.becomeFirstResponder()
                break
                
            case otpField3:
                otpField4.becomeFirstResponder()
                break
                
            case otpField4:
                otpField4.resignFirstResponder()
                break
                
            
            default:
                break
            }
        }
    }
    
    


}
