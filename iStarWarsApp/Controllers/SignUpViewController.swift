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
    
    @IBAction func handleSignUp(_ sender: UIButton) {
        
        guard let email = emailField.text else { return }
        guard let password = passwordField.text else { return }
        
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if error != nil {
                print("Error \(error!.localizedDescription)")
            }
        }
    }
    

}
