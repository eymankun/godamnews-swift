//
//  NewsData.swift
//  GodamNews
//
//  Created by Aiman on 2021/07/11.
//

import Foundation

struct NewsData: Codable {
    
    let hits: [HitData]
    
    struct HitData: Codable, Identifiable {
        
        var id: String{
            return String(objectID)
        }
        
        let title: String
        let url: String?
        let objectID: Int
    }
}
