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
    
//    var info: Sets?
    var sets: Info?
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTable()

//        APIManagerAll.shared.getInfoForAll { (sets, error) in
//            if let sets = sets {
//                self.info = sets
//                self.infoAllTableView.reloadData()
//
//            }
//                print("vrakja nesto")
//            }
                 APIManagerAll.shared.getInfoForAll { (sets, error) in
                        if let info = sets {
                            self.sets = info
                            self.infoAllTableView.reloadData()
            
                        }
                            print("vrakja nesto")
                        }
    }
    func setupTable() {
        infoAllTableView.register(UINib(nibName: "InfoTableViewCell", bundle: nil), forCellReuseIdentifier: "infoCell")
        infoAllTableView.dataSource = self
        infoAllTableView.delegate = self
    }
}
extension InfoAllViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if let set = info {
//            return set.classes.count
        if let sets = sets {
            return sets.sets.count
        }
        return 0
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell") as! InfoTableViewCell
//        let set = info?.classes[indexPath.row]
        let set = sets?.sets[indexPath.row]
        cell.lblClasses.text = set
        return cell
    }
}
