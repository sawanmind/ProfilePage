//
//  Alert Extension.swift
//  Project Starter
//
//  Created by iOS Developer on 1/3/18.
//  Copyright © 2018 sawanmind. All rights reserved.
//

import UIKit





extension UIViewController {
    
    
    
    func showAlert(title:String,message:String, btnTitle:String,completion:@escaping() -> Void){
        let alert = UIAlertController(title: title, message:  message , preferredStyle: .alert)
        alert.view.tintColor = UIColor.black
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: btnTitle, style: .default, handler: { (alert) in
            completion()
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func GoToHomeVC(title:String,message:String){
        let alert = UIAlertController(title: title, message:  message , preferredStyle: .alert)
        alert.view.tintColor = UIColor.black
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: { (alert) in
            self.navigationController?.popToRootViewController(animated: true)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func didTapLogin(message:String,completion:@escaping() -> Void){
        let alert = UIAlertController(title: "Warning", message:  message , preferredStyle: .alert)
        alert.view.tintColor = UIColor.black
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Login", style: .default, handler: { (alert) in
            completion()
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
}
