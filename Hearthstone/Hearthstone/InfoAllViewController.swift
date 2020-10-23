//
//  InfoAllViewController.swift
//  Hearthstone
//
//  Created by Deniz Adil on 10/23/20.
//

import UIKit
import Alamofire

class InfoAllViewController: UIViewController {

    @IBOutlet weak var infoAllTableView: UITableView!
    
    var info = [Info]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTable()
        
        APIManagerAll.shared.getInfoForAll { (sets, error) in
            if let sets = sets {
                self.info = sets
               
            }
                print("vrakja nesto")
            }
    }
    func setupTable() {
        tableView.register(UINib(nibName: "InfoTableViewCell", bundle: nil), forCellReuseIdentifier: "infoCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
}
extension InfoAllViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return info.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell") as! InfoTableViewCell
        let sets = info[indexPath.row]
        cell.getInfo(sets: sets)
        return cell
    }
}
