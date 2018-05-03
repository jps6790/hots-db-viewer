//
//  HeroesVC.swift
//  HotS Database Viewer
//
//  Created by Jordan Sullivan on 5/3/18.
//  Copyright © 2018 Jordan Sullivan. All rights reserved.
//

import UIKit

class HeroesVC: UITableViewController {

    @IBOutlet weak var heroTableView: UITableView!
    
    var heroes = [HeroData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func loadHeroesPressed(_ sender: AnyObject) {
        loadHeroData()
    }
    
    // Retrieves the API data for all heroes
    func loadHeroData() {
        guard let dataUrl = URL(string: "https://hotsapi.net/api/v1/heroes") else {
            print("Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: dataUrl) { (data: Data?, response: URLResponse?, error: Error?) in
            guard let data = data else {
                print("Error retrieving data: \(String(describing: error))")
                return
            }
            
            do {
                self.heroes = try JSONDecoder().decode([HeroData].self, from: data)
                print(self.heroes)
            } catch {
                print(error)
            }
        }
        task.resume()
        
        heroTableView.delegate = self
        heroTableView.dataSource = self
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "reusableCell")
        cell.imageView?.image = downloadIcon(url: heroes[indexPath.row].iconUrl!)
        return cell
    }
    
    // Retrieves an icon from a given URL and returns it
    func downloadIcon(url: URL) -> UIImage {
        var icon: UIImage?
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                print("Error retrieving icon data: \(String(describing: error))")
                return
            }
            
            icon = UIImage.init(data: data)!
            print("\(String(describing: icon))")
            
        }.resume()
        
        return icon!
    }
    
}
