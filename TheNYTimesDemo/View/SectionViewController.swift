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
    @IBOutlet weak var menuView: MenuView!
    @IBOutlet var leftContraings: NSLayoutConstraint!
    @IBOutlet weak var activityIndicate: UIActivityIndicatorView!
    var mainMenuActive = false
    let sectionViewModel = SectionViewModel()
    let sectionTopic = Section.allCases
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.menuView.delegate = self
        
        leftContraings.constant = 0
        mainMenuActive = true
        sectionViewModel.vmDelegate = self
        sectionViewModel.loadSections(inTopic: .ALL_Section,inPeriod: .SevenDay)
        
    }
    
    
    @IBAction func openMainMenu(_ sender: Any) {
        if (mainMenuActive) {
            leftContraings.constant = 182
        } else {
            leftContraings.constant = 0
            
        }
        UIView.animate(withDuration: 0.3, animations: {
            self.view.layoutIfNeeded()
        })
        mainMenuActive = !mainMenuActive
    }
    
    
}

extension SectionsViewController: SectionViewModelDelegate {
    func showPrograss() {
        //
        self.activityIndicate.startAnimating()
    }
    
    func stopPrograss() {
        //
        self.activityIndicate.stopAnimating()
    }
    
    func successfullyLoaded() {
        //
        self.tableview.reloadData()
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SectionViewCell
        self.sectionViewModel.loadSectionCell(tableView, cellForRowAt: indexPath, completion:{ (title, caption, img) in
            // get from cach
            cell.title.text = title
            cell.caption.text = caption
            cell.sectionimage.image = img
            
        })
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
            let url = self.sectionViewModel.getDetailPageUrl(indexPath: indexPath)
            self.loadDetailViewController(with: url)
    }
    
    func loadDetailViewController(with urlString :String) {
        
        let mainstoryBoard = self.storyboard
        
        if let sectionViewcontroller = mainstoryBoard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController{
            sectionViewcontroller.load(with: urlString)
            self.navigationController?.pushViewController(sectionViewcontroller, animated: true)
            
        }
    }
}


extension SectionsViewController: MenuDelegate {
    func selected(with indexPath: IndexPath) {
        self.openMainMenu(self)  //Close the menu
        let sectionType = self.sectionTopic[indexPath.row] // get section
        self.sectionViewModel.loadSections(inTopic: sectionType, inPeriod: .SevenDay)
    }
    
}
