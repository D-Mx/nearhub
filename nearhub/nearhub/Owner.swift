//
//  Owner.swift
//  nearhub
//
//  Created by Anselmo Torres on 2/7/17.
//  Copyright © 2017 Anselmo Torres. All rights reserved.
//

import UIKit
import ObjectMapper

struct Owner: Mappable {
    var ownerId: Int!
    var name: String!
    var url: String!
    var avatarURL: String?
    var avatarImage: UIImage?
    
    init?(map: Map) { }
    
    mutating func mapping(map: Map) {
        
        ownerId <- map["id"]
        name <- map["login"]
        url <- map["html_url"]
        avatarURL <- map["avatar_url"]
    }
}
