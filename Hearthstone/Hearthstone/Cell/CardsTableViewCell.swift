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
        if avatar.image == nil {
            self.avatar.kf.setImage(with: URL(string: STATIC_PIC))
        }
        if let avatarName = cards.img {
            self.avatar.kf.setImage(with: URL(string: avatarName))
        }
    }
    override func prepareForReuse() {
    avatar.image = nil
    }
}
