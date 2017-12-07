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
import ManualLayout

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
  let window = UIWindow(frame: UIScreen.main.bounds)
  window.backgroundColor = .white
  window.makeKeyAndVisible()

  let loginViewController = LoginViewController()
  let navigationController = UINavigationController(rootViewController: loginViewController).then {
      if #available(iOS 11.0, *) {
        $0.navigationBar.prefersLargeTitles = true
      }
      $0.navigationBar.barTintColor = UIColor(red:0.25, green:0.29, blue:0.42, alpha:1.0)
      $0.navigationBar.barStyle = .black
      $0.navigationBar.isTranslucent = false
      $0.navigationBar.tintColor = .white
  }
  window.rootViewController = navigationController

  self.window = window
  return true
  }
  
}

