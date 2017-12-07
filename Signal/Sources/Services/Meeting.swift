//
//  Meeting.swift
//  Signal
//
//  Created by Truth on 2017. 12. 7..
//  Copyright © 2017년 k1mtruth. All rights reserved.
//

import ObjectMapper

struct Meeting: Mappable {
  
  var id: Int!
  var title: String!
  var content: String!
  var createdTime: Date!
  var startTime: Date!
  var endTime: Date!
  var entryDueTime: Date!
  var entryFee: Int!
  var entryFeeType: String!
  var location: String!
  var maximumPeople: Int!
  var meetingImagePath: String!
  
  init?(map: Map) {
  }
  
  mutating func mapping(map: Map) {
    self.id <- map["id"]
    self.title <- map["title"]
    self.content <- map["content"]
    self.createdTime <- (map["created_time"], ISO8601DateTransform())
    self.startTime <- (map["start_time"], ISO8601DateTransform())
    self.endTime <- (map["end_time"], ISO8601DateTransform())
    self.entryDueTime <- (map["entry_due_time"], ISO8601DateTransform())
    self.entryFee <- map["entry_fee"]
    self.entryFeeType <- map["entry_fee_type"]
    self.location <- map["location"]
    self.maximumPeople <- map["maximum_people"]
    self.meetingImagePath <- map["meeting_photo_path"]
  }
  
}
