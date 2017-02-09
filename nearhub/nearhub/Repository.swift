//
//  Repo.swift
//  nearhub
//
//  Created by Anselmo Torres on 2/6/17.
//  Copyright © 2017 Anselmo Torres. All rights reserved.
//

import ObjectMapper

struct Repository: Mappable {
    var repoId: Int!
    var name: String!
    var description: String!
    var owner: Owner!
    var repoURL: String!
    var isPrivate: Bool
    var isFork: Bool
    
    init?(map: Map) {
        self.isFork = false
        self.isPrivate = false
    }
    
    mutating func mapping(map: Map) {
        
        repoId <- map["username"]
        name <- map["name"]
        description <- map["description"]
        owner <- map["owner"]
        isPrivate <- map["private"]
        isFork <- map["fork"]
        repoURL <- map["html_url"]
    }
}

