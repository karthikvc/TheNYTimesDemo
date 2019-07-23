//
//  Networking+extension.swift
//  TheNYTimesDemo
//
//  Created by Admin on 7/23/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation

enum APIService {
    
    case getSection(topic:Section)
    
    case getSectionWith(topic:Section, period:Period)
    
}

extension APIService {
    
    var path:String {
        
        switch self {
        case .getSection(let type):
            return "\(BASE_URL)\(type.Topic)/1.json?\(API_KEY_PARAMS)\(API_KEY)"
            
        case .getSectionWith(let type, let Peroid):
            return "\(BASE_URL)\(type.Topic)/\(Peroid.rawValue).json?\(API_KEY_PARAMS)\(API_KEY)"
        }
        
    }
    
    var method:String {
        
        switch self {
        case .getSection( _):
            return "GET"
        case .getSectionWith(_, _):
            return "GET"
        }
    }
    
}
