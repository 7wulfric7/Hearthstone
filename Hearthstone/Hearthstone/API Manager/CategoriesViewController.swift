//
//  CategoriesViewController.swift
//  Hearthstone
//
//  Created by Deniz Adil on 10/25/20.
//

import UIKit

class CategoriesViewController: UIViewController {

    var names = [String]()
    var type = ""
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
setupTable()
        title = self.type
    }
    

   
    func setupTable() {
        tableView.register(UINib(nibName: "InfoTableViewCell", bundle: nil), forCellReuseIdentifier: "infoCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
    }
    
}
extension CategoriesViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if let set = info {
//            return set.classes.count
        
        
        return names.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell") as! InfoTableViewCell
//        let set = info?.classes[indexPath.row]
        let type = names[indexPath.row]
        cell.lblClasses.text = type

        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let name = names[indexPath.row]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "FirstViewController") as! ViewController
        controller.name = name
        controller.type = type
        navigationController?.pushViewController(controller, animated: true)
    }
}
