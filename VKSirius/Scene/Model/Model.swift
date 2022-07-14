//
//  Model.swift
//  VKSirius
//
//  Created by developer on 14.07.2022.
//

import Foundation

struct App : Codable{
    var name: String
    var description: String
    var link: String
    var iconUrl: String
    
    private enum CodingKeys: String, CodingKey {
        case name, description, link, iconUrl = "icon_url"
    }
}

struct AppsBody: Codable{
    var services: [App]
}

struct AppsRespons: Codable{
    var body: AppsBody
    var status: Int
}

