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
    @IBOutlet weak var activity: UIActivityIndicatorView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Sign Up"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        activity.isHidden = true
    }
    
    
    // Allow the user to create their account
    @IBAction func handleSignUp(_ sender: UIButton) {
        
        self.activity.isHidden = false
        self.activity.startAnimating()
        
        // Check if email and password are not nil
        guard let email = emailField.text else { return }
        guard let password = passwordField.text else { return }
        
        // Create the user using email and password
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if error != nil {
                print("Error \(error!.localizedDescription)")
            } else {
                print("Sucess!")
                
                self.activity.isHidden = true
                self.activity.stopAnimating()
                
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
