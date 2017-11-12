//
//  AuthService.swift
//  Signal
//
//  Created by Truth on 2017. 11. 12..
//  Copyright © 2017년 k1mtruth. All rights reserved.
//

import Alamofire

struct AuthService: APIServiceType {
  
  static func login(
    username: String,
    password: String,
    completion: @escaping (DataResponse<Any>) -> Void
  ) {
    let urlString = self.url("/account/login")
    let parameters: [String: Any] = [
      "username": username,
      "password": password,
    ]
    Alamofire
    .request(urlString, method: .post, parameters: parameters)
    .validate(statusCode: 200..<400)
    .responseJSON { response in
      completion(response)
    }

  }
}
