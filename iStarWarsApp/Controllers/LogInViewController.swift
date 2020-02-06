//
//  LogInViewController.swift
//  iStarWarsApp
//
//  Created by Dionte Silmon on 2/5/20.
//  Copyright © 2020 Dionte Silmon. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class LogInViewController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Log In"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    
    @IBAction func handlerLogIn(_ sender: UIButton) {
        
        sender.pulse()
        
        SVProgressHUD.setDefaultStyle(SVProgressHUDStyle.dark)
        SVProgressHUD.show()
        
        guard let email = emailField.text else { return }
        guard let password = passwordField.text else { return }
        
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            
            if error != nil {
                print("Error, \(error!.localizedDescription)")
            } else {
                print("Loging in...")
                
                SVProgressHUD.dismiss()
                
                self.performSegue(withIdentifier: "goToHomePage", sender: self)
            }
            
        }
        
    }
    
    

}
