//
//  HomePageViewController.swift
//  iStarWarsApp
//
//  Created by Dionte Silmon on 2/5/20.
//  Copyright © 2020 Dionte Silmon. All rights reserved.
//

import UIKit
import Firebase

private enum Category: String {
    case Characters = "Characters"
    case Planets = "Planets"
    case Starships = "Starships"
    case Vehicles = "Vehicles"
    case Films = "Films"
}

class HomePageViewController: UIViewController {
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    private var layout: UICollectionViewFlowLayout!
    private let categories: [String] = ["Characters", "Planets", "Starships", "Vehicles", "Films"]
    private let colors: [UIColor] = [.cyan, .red, .green, .blue, .purple]
    private var row = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        categoryCollectionView.backgroundColor = UIColor.darkGray
        
        let nib = UINib(nibName: "CategoryCollectionViewCell", bundle: nil)
        categoryCollectionView.register(nib, forCellWithReuseIdentifier: "peopleCell")
        
        
        setupFlowLayout()
    }
    
    // Setup the flow layout
    private func setupFlowLayout() {
        
        layout = UICollectionViewFlowLayout()
        
        let padding: CGFloat = 30
        let collectionViewSize = categoryCollectionView.frame.size.width - padding
        
        layout.itemSize = CGSize(width: collectionViewSize / 2, height: collectionViewSize / 2)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 0, right: 10)
        layout.scrollDirection = .vertical
        
        categoryCollectionView.setCollectionViewLayout(layout, animated: true)
        
    }
    
    
    // MARK: - Sign out button
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

// MARK: - CollectionView Delegate and DataSource Methods

extension HomePageViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "peopleCell", for: indexPath) as! CategoryCollectionViewCell
        
        let category = categories[indexPath.item]
        
        // Grab the color for the background
        let bgColor = colors[indexPath.item]
        
        // Setup the cell border and shadow affects
        cell.designBorderBackground(radius: 10, borderColor: .black, shadowColor: bgColor)
        
        cell.contentView.backgroundColor = bgColor
        
        // Check if the indexPath.item is an even number
        // if it is a even number change that cell text color to white
        // else change the text color to black
        if indexPath.item % 2 == 0 {
            cell.peopleLabel.textColor = .black
        } else {
            cell.peopleLabel.textColor = .white
        }
        
        cell.peopleLabel.text = category
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let rowIndex = collectionView.indexPathsForSelectedItems?.first {
            row = rowIndex.row
        }
        
        let category = categories[row]
        
        switch category {
        case Category.Characters.rawValue:
            performSegue(withIdentifier: "goToCharacters", sender: self)
        default:
            print("No category")
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToCharacters" {
            let controller = segue.destination as! CharactersViewController
        }
    }
    
    
}
