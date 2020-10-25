//
//  Info.swift
//  Hearthstone
//
//  Created by Deniz Adil on 10/23/20.
//

import UIKit

struct Sets: Decodable {
    var classes: Array<String>
    var sets: Array<String>
    var standard: Array<String>
    var wild: Array<String>
    var types: Array<String>
    var factions: Array<String>
    var qualities: Array<String>
    var races: Array<String>
    var locales: Array<String>
    
}

struct Info: Decodable {
    var sets = [""]
}
