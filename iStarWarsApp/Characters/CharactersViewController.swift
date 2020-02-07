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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData(url: baseURL)
    }
    
    private func fetchData(url: String) {
        
        Alamofire.request(url, method: .get).responseJSON { (response) in
            if let responseValue = response.result.value as! [String: Any]? {
                print(responseValue)
                
                if let responseData = responseValue["results"] as! [[String: Any]]? {
                    print(responseData)
                    self.people = responseData
                    self.peopleCollectionView.reloadData()
                }
            } else {
                print("Error getting data, \(response.error!)")
            }
        }
        
    }
    
    

}


extension CharactersViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        cell.backgroundColor = .red
        
        return cell
        
    }
    
    
}
