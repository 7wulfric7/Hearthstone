//
//  CardsTableViewCell.swift
//  Hearthstone
//
//  Created by Deniz Adil on 10/21/20.
//

import UIKit

class CardsTableViewCell: UITableViewCell {

    @IBOutlet weak var lblCardID: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblCardSet: UILabel!
    @IBOutlet weak var lblType: UILabel!
    @IBOutlet weak var lblPlayerClass: UILabel!
    
    
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
    }
}
