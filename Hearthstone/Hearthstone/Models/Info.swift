//
//  Info.swift
//  Hearthstone
//
//  Created by Deniz Adil on 10/23/20.
//

import UIKit

struct Sets: Decodable {
    var classes: Array<String> = []
    var sets: Array<String> = []
    var standard: Array<String> = []
    var wild: Array<String> = []
    var types: Array<String> = []
    var factions: Array<String> = []
    var qualities: Array<String> = []
    var races: Array<String> = []
    
    
    func getArrayForKey(key: String) -> [String] {
        switch key {
        case "classes":
            return classes
        case "sets":
            return sets
        case "standard":
        return standard
        case "wild":
            return wild
        case "types":
            return types
        case "factions":
            return factions
        case "qualities":
            return qualities
        case "races":
            return races
        default:
           return []
        }
    }
}
