//
//  ShowModel.swift
//  trainingmvp
//
//  Created by stag on 08/11/18.
//  Copyright © 2018 stag. All rights reserved.
//

import Foundation
import ObjectMapper

class ShowModel: Mappable{
    var id: String!
    var name: String!
    var job: String!
    var age: String!
    var imageURL: String!
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        job <- map["job"]
        age <- map["age"]
        imageURL <- map["imageURL"]
    }
}
