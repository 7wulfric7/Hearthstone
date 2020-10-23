//
//  CardsTableViewCell.swift
//  Hearthstone
//
//  Created by Deniz Adil on 10/21/20.
//

import UIKit
import Kingfisher

class CardsTableViewCell: UITableViewCell {

    @IBOutlet weak var lblCardID: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblCardSet: UILabel!
    @IBOutlet weak var lblType: UILabel!
    @IBOutlet weak var lblPlayerClass: UILabel!
    @IBOutlet weak var avatar: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func getInfoForCrads(cards: Cards) {
        self.lblCardID.text = cards.cardId
        self.lblName.text = cards.name
        self.lblCardSet.text = cards.cardSet
        self.lblType.text = cards.type
        self.lblPlayerClass.text = cards.playerClass
        
        
//        APIManager.shared.getInfoFromApi { (card, error) in
////            if let avatarName =  {
//            let avatar = IMG_BASE_URL + "\(String(describing: cards.img))" + ".png"
//                self.avatar.kf.setImage(with: URL(string: avatar))

//        }
    }
}
