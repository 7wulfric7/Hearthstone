//
//  SingleCardViewController.swift
//  Hearthstone
//
//  Created by Deniz Adil on 10/22/20.
//

import UIKit
import Alamofire
import Kingfisher

class SingleCardViewController: UIViewController {
    @IBOutlet weak var lblCardSet: UILabel!
    @IBOutlet weak var lblText: UILabel!
    @IBOutlet weak var lblLocale: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    var card = Cards()
   
    override func viewDidLoad() {
        super.viewDidLoad()

        APIManagerTwo.shared.getInfoForCard(id: card.cardId!) { (card, error) in
        
            if let card = card {
                self.getInfoForCrad(card: card)
            }
           
        }
        
    }
    func getInfoForCrad(card: Cards) {
     
        self.lblCardSet.text = card.cardSet
        self.lblText.text = card.text
        self.lblLocale.text = card.locale
        APIManagerTwo.shared.getInfoForCard(id: card.cardId!) { (card, error) in
            if let imageName = card?.cardId {
                let image = IMG_BASE_URL + imageName + ".png"
                self.image.kf.setImage(with: URL(string: image))
            }
            
        }
    }
    
}

