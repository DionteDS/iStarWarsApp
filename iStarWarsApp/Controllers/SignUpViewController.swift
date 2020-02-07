//
//  SignUpViewController.swift
//  iStarWarsApp
//
//  Created by Dionte Silmon on 2/5/20.
//  Copyright © 2020 Dionte Silmon. All rights reserved.
//

import UIKit
import Firebase


class SignUpViewController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Sign Up"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    
    // Allow the user to create their account
    @IBAction func handleSignUp(_ sender: UIButton) {
//        SVProgressHUD.setDefaultStyle(SVProgressHUDStyle.dark)
//        SVProgressHUD.show()
        
        // Check if email and password are not nil
        guard let email = emailField.text else { return }
        guard let password = passwordField.text else { return }
        
        // Create the user using email and password
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if error != nil {
                print("Error \(error!.localizedDescription)")
            } else {
                print("Sucess!")
                
//                SVProgressHUD.dismiss()
                
                self.performSegue(withIdentifier: "goToHomePage", sender: self)
            }
        }
    }
    

}

//MARK: - TextField Delegate Methods

extension SignUpViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
