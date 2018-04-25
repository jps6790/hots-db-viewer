//
//  ViewController.swift
//  HotS Database Viewer
//
//  Created by Student on 4/9/18.
//  Copyright © 2018 Jordan Sullivan. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func loadHeroesPressed(_ sender: AnyObject) {
        loadHeroData()
    }
    
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
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
