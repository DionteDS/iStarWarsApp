//
//  CharactersViewController.swift
//  iStarWarsApp
//
//  Created by Dionte Silmon on 2/7/20.
//  Copyright © 2020 Dionte Silmon. All rights reserved.
//

import UIKit
import Alamofire


class CharactersViewController: UIViewController {
    
    @IBOutlet weak var peopleCollectionView: UICollectionView!
    
    var people: [[String: Any]] = [[String: Any]]()
    let baseURL = "https://swapi.co/api/people/"
    var layout: UICollectionViewFlowLayout!
    private let colors: [UIColor] = [.cyan, .red, .green, .blue, .purple, .yellow, .darkGray, .brown, .magenta, .orange]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "PeopleCollectionViewCell", bundle: nil)
        peopleCollectionView.register(nib, forCellWithReuseIdentifier: "peopleCell")
        
        fetchData(url: baseURL)
        
        setupFlowlayout()
    }
    
    private func fetchData(url: String) {
        
        Alamofire.request(url, method: .get).responseJSON { (response) in
            if let responseValue = response.result.value as! [String: Any]? {
//                print(responseValue)
                
                if let responseData = responseValue["results"] as! [[String: Any]]? {
//                    print(responseData)
                    self.people = responseData
                    self.peopleCollectionView.reloadData()
                }
            } else {
                print("Error getting data, \(response.error!)")
            }
        }
        
    }
    
    private func setupFlowlayout() {
        
        layout = UICollectionViewFlowLayout()
        
        let collectionSizeWidth = peopleCollectionView.frame.size.width
        let collectionSizeHeight = peopleCollectionView.frame.size.height
        
        layout.itemSize = CGSize(width: collectionSizeWidth - 92, height: collectionSizeHeight - 540)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
        layout.scrollDirection = .vertical
        
        peopleCollectionView.setCollectionViewLayout(layout, animated: true)
    }
    
    

}


extension CharactersViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return people.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "peopleCell", for: indexPath) as! PeopleCollectionViewCell
        
        cell.designBorderBackground()
        
        let colorBG = colors[indexPath.item]
        
        let swPerson = people[indexPath.row]
        
        cell.viewBg.backgroundColor = colorBG
        cell.nameLbl.text = swPerson["name"] as? String ?? ""
        cell.genderLbl.text = swPerson["gender"] as? String ?? ""
        cell.birthYear.text = swPerson["birth_year"] as? String ?? ""
        cell.heightLbl.text = swPerson["height"] as? String ?? ""
        
        return cell
        
    }
    
    
}
