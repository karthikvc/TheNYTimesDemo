//
//  SectionViewModel.swift
//  TheNYTimesDemo
//
//  Created by Admin on 7/23/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation

protocol SectionViewModelDelegate {
    
    func showPrograss()
    func stopPrograss()
    func successfullyLoaded()
    func errorOnLoading()
    
}

class SectionViewModel {
    
    var vmDelegate : SectionViewModelDelegate!
    
    private let networking = Networking()
    private var sections: Sections?
    private var imgCache = NSCache<AnyObject,AnyObject>()
    
    
    func loadSections(inTopic: Section, inPeriod:Int = 1) {
        
        //activityIndicate.startAnimating()
        networking.performFetch ( with: APIService.getSectionWith(topic: inTopic, period: inPeriod), completion: {(Result) in
            
            self.sections = Result
            DispatchQueue.main.async {
                //self.loadAllSectionsViewController()
                //self.activityIndicate.stopAnimating()
                //self.tableview.reloadData()
            }
        }, completionWith: {(Error) in
            
            DispatchQueue.main.async {
                
                //self.activityIndicate.stopAnimating()
            }
            
        })
    }
    
    func getSectionsCount() -> Int {
        guard let items = self.sections  else {
            return 0
        }
        
        if let section = items.results {
            return section.count
        }
        
        return 0
    }
    
}
