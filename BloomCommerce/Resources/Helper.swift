//
//  Helper.swift
//  BloomCommerce
//
//  Created by Darshil Agrawal on 20/05/21.
//


import UIKit
class Helper{
    static func sendAlert(_ alertString:String,vc:UIViewController) {
        let alert=UIAlertController(title: "Incomplete Information", message: alertString, preferredStyle: .alert)
        let dismissAction=UIAlertAction(title: "Retry", style: .default, handler: nil)
        alert.addAction(dismissAction)
        vc.present(alert, animated: true, completion: nil)
    }
}
