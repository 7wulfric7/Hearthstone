//
//  ViewController.swift
//  Hearthstone
//
//  Created by Deniz Adil on 10/21/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var cards = [Cards]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()

        APIManager.shared.getInfoFromApi { (cards, error) in
            if let cards = cards {
                self.cards = cards
                self.tableView.reloadData()
            }
                print("vrakja nesto")
            }
        }
        
    func setupTable() {
        tableView.register(UINib(nibName: "CardsTableViewCell", bundle: nil), forCellReuseIdentifier: "cardsCell")
        tableView.dataSource = self
        tableView.delegate = self
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
}



