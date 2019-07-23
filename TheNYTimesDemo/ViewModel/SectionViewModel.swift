//
//  SectionViewModel.swift
//  TheNYTimesDemo
//
//  Created by Admin on 7/23/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

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
    
    
    func loadSections(inTopic: Section, inPeriod:Period = .OneDay) {
        
        self.vmDelegate.showPrograss()
        
        networking.performFetch ( with: APIService.getSectionWith(topic: inTopic, period: inPeriod), completion: {(Result) in
            
            self.sections = Result
            DispatchQueue.main.async {
                self.vmDelegate.stopPrograss()
                self.vmDelegate.successfullyLoaded()
            }
        }, completionWith: {(Error) in
            
            DispatchQueue.main.async {
                self.vmDelegate.stopPrograss()
                
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
    
    func getDetailPageUrl(indexPath:IndexPath) -> String {
        
        guard let items = self.sections  else {
            return ""
        }
        
        if let section = items.results {
            
            let item = section[indexPath.row]
            if let url = item.url {
            return url
            }
        }
        return ""
    }
    
    
    func loadSectionCell(_ tableView: UITableView,cellForRowAt indexPath: IndexPath,
                         completion: ((_ title:String, _ caption:String, _ image:UIImage) -> Void)?){
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SectionViewCell
        
        guard let items = self.sections  else {
            cell.textLabel?.text = " "
            return
        }
        
        if let section = items.results  {
            
            let item = section[indexPath.row]
            
            //load Image
            let media =  item.media
            let assetid = item.asset_id
            //load from cache
            cell.sectionimage.image = UIImage()
            if let img = imgCache.object(forKey: assetid as AnyObject) as? UIImage {
                DispatchQueue.main.async {
                    
                    if let title = item.title, let caption = item.abstract {
                        completion!(title,caption,img)
                    }
                    
                }
            }
            else {
                // load from url
                guard let lastItem = media?.count else { return  }
                if lastItem > 0 {
                    
                    if let metadata = media?[lastItem - 1] {
                        //media?.lastObject as? NSDictionary
                        let imageItems = metadata.media_metadata
                        
                        if let lastImageItemCount = imageItems?.count{
                            let imageItem  = imageItems?[lastImageItemCount - 1]
                            let imageurlString = imageItem?.url
                            let url = URL(string: imageurlString!)
                            
                            DispatchQueue.global().async {
                                if let data = try? Data(contentsOf: url!) {
                                    DispatchQueue.main.async {
                                        if let tCell = tableView.cellForRow(at: indexPath) as? SectionViewCell {
                                            let item = section[indexPath.row]
                                            tCell.title.text = item.title
                                            tCell.caption.text =  item.abstract
                                            tCell.sectionimage.image = UIImage(data: data)
                                            self.imgCache.setObject(tCell.sectionimage.image!, forKey: assetid as AnyObject )
                                            
                                           }
                                        }}}}}}}}
             }
}
