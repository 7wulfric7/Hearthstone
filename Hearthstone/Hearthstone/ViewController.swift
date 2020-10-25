//
//  ViewController.swift
//  Hearthstone
//
//  Created by Deniz Adil on 10/21/20.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lblText: UILabel!
    
    var cards = [Cards]()
    var name = ""
    var type = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
       
        
        APIManager.shared.getCardList(name: name, type: type) { (cards, error) in
            if let cards = cards {
                self.cards = cards
               
                self.tableView.reloadData()
                if cards.count == 0 {
                    self.tableView.isHidden = true
                    self.lblText.isHidden = false
                }
            }
        }
            
        }
        
    func setupTable() {
        tableView.register(UINib(nibName: "CardsTableViewCell", bundle: nil), forCellReuseIdentifier: "cardsCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
    }
  
}
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cards.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cardsCell") as! CardsTableViewCell
        let card = cards[indexPath.row]
        cell.getInfoForCrads(cards: card)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let displayedCard = cards[indexPath.row]
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let controller = storyboard.instantiateViewController(withIdentifier: "SingleCardViewController") as! SingleCardViewController
                controller.card = displayedCard
        navigationController?.pushViewController(controller, animated: true)
    }
}




