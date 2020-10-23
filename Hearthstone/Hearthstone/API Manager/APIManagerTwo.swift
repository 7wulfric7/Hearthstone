//
//  APIManagerTwo.swift
//  Hearthstone
//
//  Created by Deniz Adil on 10/22/20.
//

import UIKit
import Alamofire

class APIManagerTwo {
    static let shared = APIManagerTwo()
        init() {}
        
    func getInfoForCard(id: String, completion: @escaping (_ cards: Cards?, _ error: Error?) -> Void) {
            let url = BASE_URL + id
            let headers: HTTPHeaders = ["x-rapidapi-host" : "omgvamp-hearthstone-v1.p.rapidapi.com",
            "x-rapidapi-key": "9adb1e1999msh88e589a4ea778bdp1b73a4jsnbb56b57222eb"]
            
        AF.request(url, headers: headers).responseDecodable (of: [Cards].self) { response in
            if let error = response.error {
                debugPrint(response)
                completion(nil, error)
                return
            }
            if let cards = response.value?.first {
                completion(cards, nil)
                print(cards)
            }
        }
    }
}
