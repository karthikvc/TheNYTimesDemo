//
//  Networking.swift
//  TheNYTimesDemo
//
//  Created by Admin on 7/23/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation


enum Section: CaseIterable {
    case ALL_Section
    case Books
    case Foods
    case Health
    case Magazine
    case Movies
    case Sports
    //case Education
    case Science
    case Travel
    
}

extension Section{
    
    var Topic:String{
        
        switch self {
        case .ALL_Section:
            return "all-sections"
        case .Sports:
            return "Sports"
        case .Movies:
            return "Movies"
            //            case .Education:
        //                 return "education"
        case .Books:
            return "Books"
        case .Foods:
            return "Food"
        case .Health:
            return "Health"
        case .Magazine:
            return "Magazine"
        case .Science:
            return "Science"
        case .Travel:
            return "Travel"
        }
        
    }
    
}


struct Networking {
    
    func performFetch(with endPoint: APIService,
                      completion: ((_ Result:Sections) -> Void)?,
                      completionWith: ((_ Result:Error) -> Void)?
        )  {
        
        let urlString = endPoint.path
        
        var request = URLRequest(url: URL(string: urlString)!)
        request.httpMethod = endPoint.method
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let urlSession = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                completionWith!(error)
                return
            }
            guard let data = data else {
                return
            }
            
            let responseData = String(data: data, encoding: String.Encoding.utf8)
            print(responseData!)
            
            do {
                //if let jsonDict = try JSONSerialization.jsonObject(with: data) as? NSDictionary {
                // print(jsonDict)
                
                let jsonDecoder = JSONDecoder()
                
                let response = try jsonDecoder.decode(Sections.self, from: data)
                //return response
                print(response)
                
                completion!(response)
                //}
            }
            catch {
                print(error)
            }
            
        }
        
        urlSession.resume()
    }
}
