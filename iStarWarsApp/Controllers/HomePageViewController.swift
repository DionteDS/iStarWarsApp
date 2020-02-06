//
//  HomePageViewController.swift
//  iStarWarsApp
//
//  Created by Dionte Silmon on 2/5/20.
//  Copyright © 2020 Dionte Silmon. All rights reserved.
//

import UIKit
import Firebase

class HomePageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.hidesBackButton = true
    }
    
    @IBAction func tappedLogout(_ sender: UIBarButtonItem) {
        
        // Sign out of app
        do {
            try Auth.auth().signOut()
            
            // If root view controller is not nil Go back to root view controller (Log in and sign up page)
            guard (navigationController?.popToRootViewController(animated: true)) != nil else {
                print("No view controller to pop off too.")
                return
            }
        } catch {
            print("Error signing out, \(error)")
        }
    }
    

}
