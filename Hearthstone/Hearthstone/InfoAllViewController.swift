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
var types = [String]()
    var sets = Sets()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Cards Types"
        setupTable()
        APIManagerAll.shared.getInfoForAll { (json, error) in
            if let json = json {
                self.parseData(json: json)
            }
        }
//        APIManagerAll.shared.getInfoForAll { (sets, error) in
//            if let sets = sets {
//                self.info = sets
//                self.infoAllTableView.reloadData()
//
//            }
//                print("vrakja nesto")
//            }
//                 APIManagerAll.shared.getInfoForAll { (sets, error) in
//                        if let info = sets {
//                            self.sets = info
//                            self.infoAllTableView.reloadData()
//            
//                        }
//                            print("vrakja nesto")
//                        }
    
    }
  
    func parseData(json: [String: Any]) {
        types.append(contentsOf: json.keys)
        types.removeAll(where: {$0 == "patch"})
        let decoder = JSONDecoder()
        do {
            let data = try JSONSerialization.data(withJSONObject: json, options: .fragmentsAllowed)
            self.sets = try decoder.decode(Sets.self, from: data)
            infoAllTableView.reloadData()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func setupTable() {
        infoAllTableView.register(UINib(nibName: "InfoTableViewCell", bundle: nil), forCellReuseIdentifier: "infoCell")
        infoAllTableView.dataSource = self
        infoAllTableView.delegate = self
        infoAllTableView.tableFooterView = UIView()
    }
}
extension InfoAllViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if let set = info {
//            return set.classes.count
        
        
        return types.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell") as! InfoTableViewCell
//        let set = info?.classes[indexPath.row]
        let type = types[indexPath.row]
        cell.lblClasses.text = type
        cell.backgroundColor = .black
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.red
        cell.selectedBackgroundView = backgroundView
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let type = types[indexPath.row]
        let dataArray = sets.getArrayForKey(key: type)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let controller = storyboard.instantiateViewController(withIdentifier: "CategoriesViewController") as! CategoriesViewController
        controller.names = dataArray
        controller.type = type

        if type == "wild" || type == "standard" {
            controller.type = "sets"
        }
        navigationController?.pushViewController(controller, animated: true)
    }
}
