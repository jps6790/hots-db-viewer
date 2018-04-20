//
//  TalentsVC.swift
//  HotS Database Viewer
//
//  Created by Student on 4/9/18.
//  Copyright © 2018 Jordan Sullivan. All rights reserved.
//

import UIKit
import Foundation

struct TalentData: Codable {
    
    let title: String?
    let description: String?
    let iconUrl: URL?
    let ability: String?
    let cooldown: Int?
    let manaCost: Int?
    let level: Int?
    
    private enum CodingKeys: String, CodingKey {
        case title
        case description
        case iconUrl = "icon_url"
        case ability
        case cooldown
        case manaCost = "mana_cost"
        case level
    }
    
}
