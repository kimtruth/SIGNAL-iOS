//
//  AppDelegate.swift
//  Signal
//
//  Created by Truth on 2017. 11. 11..
//  Copyright © 2017년 k1mtruth. All rights reserved.
//

import UIKit

import SnapKit
import Then

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
  let window = UIWindow(frame: UIScreen.main.bounds)
  window.backgroundColor = .white
  window.makeKeyAndVisible()

  let loginViewController = LoginViewController()
  let navigationController = UINavigationController(rootViewController: loginViewController)
  window.rootViewController = navigationController

  self.window = window
  return true
  }
  
}

