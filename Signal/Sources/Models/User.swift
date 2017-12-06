//
//  User.swift
//  Signal
//
//  Created by Truth on 2017. 12. 6..
//  Copyright © 2017년 k1mtruth. All rights reserved.
//

import ObjectMapper

struct User: Mappable {
  
  var id: Int!
  var token: String!
  var username: String!
  var type: UserType!
  var fullName: String!
  var job: String!
  var phoneNumber: String!
  var profileImagePath: String!
  
  init?(map: Map) {
  }
  
  mutating func mapping(map: Map) {
    
    self.id <- map["id"]
    self.token <- map["token"]
    self.username <- map["username"]
    self.type <- (map["type"], EnumTransform<UserType>())
    self.fullName <- map["full_name"]
    self.job <- map["job"]
    self.phoneNumber <- map["phone_number"]
    self.profileImagePath <- map["profile_photo_path"]
  }
  
}
