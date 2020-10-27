//
//  Card.swift
//  Hearthstone
//
//  Created by Deniz Adil on 10/21/20.
//

import UIKit

struct Cards: Decodable {
    
    var cardId: String?
    var name: String?
    var cardSet: String?
    var type: String?
    var playerClass: String?
    var img: String?
    var text: String?
    var locale: String?
    var imgGold: String?
}

struct CardSet: Decodable {
    var Classic: [Cards]
    
}
