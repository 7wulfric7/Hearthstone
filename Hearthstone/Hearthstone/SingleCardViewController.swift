//
//  SingleCardViewController.swift
//  Hearthstone
//
//  Created by Deniz Adil on 10/22/20.
//

import UIKit
import Alamofire
import Kingfisher

let STATIC_PICS = "https://wow.zamimg.com/images/hearthstone/backs/original/Card_Back_Default.png"

class SingleCardViewController: UIViewController {
    @IBOutlet weak var lblCardSet: UILabel!
    @IBOutlet weak var lblText: UILabel!
    @IBOutlet weak var lblLocale: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var gif: UIImageView!
    @IBOutlet weak var holderView: UIView!
    
    var card = Cards()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        APIManagerTwo.shared.getInfoForCard(id: card.cardId!) { (card, error) in
        
            if let card = card {
                self.getInfoForCrad(card: card)
            }
           
        }
        self.image.kf.setImage(with: URL(string: STATIC_PICS))

    }
    func getInfoForCrad(card: Cards) {
     
        self.lblCardSet.text = card.cardSet
        self.lblText.text = card.text
        self.lblLocale.text = card.locale
        
        APIManagerTwo.shared.getInfoForCard(id: card.cardId!) { (card, error) in
//            if let imageName = card?.cardId {
//                let image = IMG_BASE_URL + imageName + ".png"
                let image = STATIC_PIC
                self.image.kf.setImage(with: URL(string: image))
            if let imageName = card?.cardId {
                let gif = GIF_URL + imageName + "_premium.gif"
                self.gif.kf.setImage(with: URL(string: gif))

                
                self.flip()
            }
//            }
//
            
            
            
           
            
        }
    }
    @objc func flip() {
        let transitionOptions: UIView.AnimationOptions = [.transitionFlipFromRight, .showHideTransitionViews]
        UIView.transition(with: image, duration: 1.0, options: transitionOptions, animations: {
                self.image.isHidden = true
            })
        UIView.transition(with: gif, duration: 1.0, options: transitionOptions, animations: {
                self.gif.isHidden = false
            })
    }
    
}

