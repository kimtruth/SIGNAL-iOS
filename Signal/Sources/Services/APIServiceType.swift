//
//  APIServiceType.swift
//  Signal
//
//  Created by Truth on 2017. 11. 12..
//  Copyright © 2017년 k1mtruth. All rights reserved.
//

protocol APIServiceType {
}

extension APIServiceType {
  static func url(_ path: String) -> String {
    return "http://blog.mikumiku.kr:25535" + path
  }
  static func mediaUrl(_ path: String) -> String {
    return self.url("/media/" + path)
  }
}
