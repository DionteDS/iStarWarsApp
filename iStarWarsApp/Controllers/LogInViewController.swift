//
//  LogInViewController.swift
//  iStarWarsApp
//
//  Created by Dionte Silmon on 2/5/20.
//  Copyright © 2020 Dionte Silmon. All rights reserved.
//

import UIKit
import Firebase



class LogInViewController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var activity: UIActivityIndicatorView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Log In"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        activity.isHidden = true
    }
    
    
    @IBAction func handlerLogIn(_ sender: UIButton) {
        
        sender.pulse()
        
        
        self.activity.isHidden = false
        self.activity.startAnimating()
        
        
        
        guard let email = emailField.text else { return }
        guard let password = passwordField.text else { return }
        
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            
            if error != nil {
                print("Error, \(error!.localizedDescription)")
            } else {
                print("Loging in...")
                
                self.activity.isHidden = true
                self.activity.stopAnimating()
                
                self.performSegue(withIdentifier: "goToHomePage", sender: self)
            }
            
        }
        
    }

}

//MARK: - TextField Delegate Methods

extension LogInViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
