//
//  Media_metadata.swift
//  TheNYTimesDemo
//
//  Created by Admin on 7/23/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation


struct Media_metadata : Codable {
    let url : String?
    let format : String?
    let height : Int?
    let width : Int?
    
    enum CodingKeys: String, CodingKey {
        
        case url = "url"
        case format = "format"
        case height = "height"
        case width = "width"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        url = try values.decodeIfPresent(String.self, forKey: .url)
        format = try values.decodeIfPresent(String.self, forKey: .format)
        height = try values.decodeIfPresent(Int.self, forKey: .height)
        width = try values.decodeIfPresent(Int.self, forKey: .width)
    }
    
}
