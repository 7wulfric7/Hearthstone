//
//  InfoTableViewCell.swift
//  Hearthstone
//
//  Created by Deniz Adil on 10/23/20.
//

import UIKit

class InfoTableViewCell: UITableViewCell {

    @IBOutlet weak var lblClasses: UILabel!
    @IBOutlet weak var lblSets: UILabel!
    @IBOutlet weak var lblStandard: UILabel!
    @IBOutlet weak var lblWild: UILabel!
    @IBOutlet weak var lblTypes: UILabel!
    @IBOutlet weak var lblFactions: UILabel!
    @IBOutlet weak var lblQualities: UILabel!
    @IBOutlet weak var lblRaces: UILabel!
    @IBOutlet weak var lblLocales: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func getInfo(sets: Info) {
        self.lblClasses.text = sets.classes
        self.lblSets.text = sets.sets
        self.lblStandard.text = sets.standard
        self.lblWild.text = sets.wild
        self.lblTypes.text = sets.ty
    }
}
