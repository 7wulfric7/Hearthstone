//
//  APIManagerAll.swift
//  Hearthstone
//
//  Created by Deniz Adil on 10/23/20.
//

import UIKit
import Alamofire

class APIManagerAll {
    static let shared = APIManagerAll()
        init() {}
        
    func getInfoForAll(completion: @escaping (_ sets: [String: Any]?, _ error: Error?) -> Void) {
            let url = ALL_BASE_URL
            let headers: HTTPHeaders = ["x-rapidapi-host" : "omgvamp-hearthstone-v1.p.rapidapi.com",
            "x-rapidapi-key": "9adb1e1999msh88e589a4ea778bdp1b73a4jsnbb56b57222eb"]
            
        AF.request(url, headers: headers).responseJSON { response in
            if let error = response.error {
                completion(nil, error)
            }
            if let jsonData = response.value, let json = jsonData as? [String: Any] {
                completion(json, nil)
            }
        }
    }
}
