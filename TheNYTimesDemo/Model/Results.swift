//
//  Results.swift
//  TheNYTimesDemo
//
//  Created by Admin on 7/23/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation

struct Results : Codable {
    let url : String?
    let adx_keywords : String?
    let column : String?
    let section : String?
    let byline : String?
    let type : String?
    let title : String?
    let abstract : String?
    let published_date : String?
    let source : String?
    let id : Int?
    let asset_id : Int?
    let views : Int?
    let des_facet : [String]?
    let org_facet : [String]?
    let per_facet : [String]?
    let geo_facet : [String]?
    let media : [Media]?
    
    enum CodingKeys: String, CodingKey {
        
        case url = "url"
        case adx_keywords = "adx_keywords"
        case column = "column"
        case section = "section"
        case byline = "byline"
        case type = "type"
        case title = "title"
        case abstract = "abstract"
        case published_date = "published_date"
        case source = "source"
        case id = "id"
        case asset_id = "asset_id"
        case views = "views"
        case des_facet = "des_facet"
        case org_facet = "org_facet"
        case per_facet = "per_facet"
        case geo_facet = "geo_facet"
        case media = "media"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        url = try values.decodeIfPresent(String.self, forKey: .url)
        adx_keywords = try values.decodeIfPresent(String.self, forKey: .adx_keywords)
        column = try values.decodeIfPresent(String.self, forKey: .column)
        section = try values.decodeIfPresent(String.self, forKey: .section)
        byline = try values.decodeIfPresent(String.self, forKey: .byline)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        abstract = try values.decodeIfPresent(String.self, forKey: .abstract)
        published_date = try values.decodeIfPresent(String.self, forKey: .published_date)
        source = try values.decodeIfPresent(String.self, forKey: .source)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        asset_id = try values.decodeIfPresent(Int.self, forKey: .asset_id)
        views = try values.decodeIfPresent(Int.self, forKey: .views)
        
        do{
            des_facet = try values.decodeIfPresent([String].self, forKey: .des_facet)
        }catch _{
            des_facet = []
        }
        do{
            org_facet = try values.decodeIfPresent([String].self, forKey: .org_facet)
        }catch _{
            org_facet = []
        }
        do{
            per_facet = try values.decodeIfPresent([String].self, forKey: .per_facet)
        }catch _{
            per_facet = []
        }
        do{
            geo_facet = try values.decodeIfPresent([String].self, forKey: .geo_facet)
        }catch _{
            geo_facet = []
        }
        
        do{
            media = try values.decodeIfPresent([Media].self, forKey: .media)
        }catch _{
            media = []
        }
    }
    
}
