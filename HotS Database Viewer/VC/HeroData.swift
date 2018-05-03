//
//  HeroData.swift
//  HotS Database Viewer
//
//  Created by Jordan Sullivan on 4/9/18.
//  Copyright © 2018 Jordan Sullivan. All rights reserved.
//

import UIKit
import Foundation

struct HeroData: Codable {
    
    let name: String?
    let iconUrl: URL?
    let role: String?
    let type: String?
    
    private enum CodingKeys: String, CodingKey {
        case name
        case iconUrl = "icon_url"
        case role
        case type
    }
    
}
