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
    return "http://13.124.38.242:7504" + path
  }
}
