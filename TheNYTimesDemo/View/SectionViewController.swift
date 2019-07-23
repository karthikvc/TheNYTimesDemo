//
//  sectionViewController.swift
//  TheNYTimesDemo
//
//  Created by Admin on 7/23/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class SectionsViewController: UIViewController {
    
    @IBOutlet weak var tableview: UITableView!
    
    let sectionViewModel = SectionViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        sectionViewModel.vmDelegate = self
        sectionViewModel.loadSections(inTopic: .ALL_Section)
        
    }
    
    
}

extension SectionsViewController: SectionViewModelDelegate {
    func showPrograss() {
        //
    }
    
    func stopPrograss() {
        //
    }
    
    func successfullyLoaded() {
        //
    }
    
    func errorOnLoading() {
        //
    }
    
}


extension SectionsViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return sectionViewModel.getSectionsCount()
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
    }
}
