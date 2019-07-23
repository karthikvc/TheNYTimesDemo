//
//  MenuView.swift
//  TheNYTimesDemo
//
//  Created by Admin on 7/23/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

protocol MenuDelegate {
    func selected(with indexPath: IndexPath)
    
}


class MenuView: UIView {

    @IBOutlet weak var tableview: UITableView!
    var delegate: MenuDelegate?
    
    let sections = Section.allCases.map{ $0.Topic }//["Media","sports","Movies","Education","Books","Foods","Health"]
    
    override func awakeFromNib() {
        
        self.tableview.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

}

extension MenuView : UITableViewDelegate, UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = sections[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.delegate?.selected(with: indexPath)
        
    }
    
}

