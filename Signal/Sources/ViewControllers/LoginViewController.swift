//
//  LoginViewController.swift
//  Signal
//
//  Created by Truth on 2017. 11. 11..
//  Copyright © 2017년 k1mtruth. All rights reserved.
//

import UIKit

final class LoginViewController: UIViewController {
  
  // MARK: UI
  
  fileprivate let logoImageView = UIImageView().then {
    $0.image = UIImage(named: "pic_login_logotype")
    $0.contentMode = .scaleAspectFit
  }
  fileprivate let usernameTextField = BorderedTextField().then {
    $0.autocorrectionType = .no
    $0.autocapitalizationType = .none
    $0.placeholder = "아이디"
  }
  fileprivate let passwordTextField = BorderedTextField().then {
    $0.isSecureTextEntry = true
    $0.placeholder = "비밀번호"
  }
  fileprivate let loginButton = UIButton().then {
    $0.backgroundColor = UIColor(red:0.32, green:0.84, blue:0.93, alpha:1.0)
    $0.setTitle("로그인", for: .normal)
    $0.setTitleColor(UIColor(red:0.25, green:0.29, blue:0.42, alpha:1.0), for: .normal)
    $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
    $0.layer.cornerRadius = 2
  }
  fileprivate let registerButton = UIButton().then {
    $0.backgroundColor = UIColor(red:0.32, green:0.84, blue:0.93, alpha:1.0)
    $0.setTitle("회원가입", for: .normal)
    $0.setTitleColor(UIColor(red:0.25, green:0.29, blue:0.42, alpha:1.0), for: .normal)
    $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
    $0.layer.cornerRadius = 2
  }
  
  // MARK: View Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.title = "로그인"
    
    self.loginButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
    
    self.view.addSubview(self.logoImageView)
    self.view.addSubview(self.usernameTextField)
    self.view.addSubview(self.passwordTextField)
    self.view.addSubview(self.loginButton)
    self.view.addSubview(self.registerButton)
    
    self.logoImageView.snp.makeConstraints { make in
      make.top.equalTo(self.topLayoutGuide.snp.bottom).offset(54)
      make.left.equalTo(71.5)
      make.right.equalTo(-71.5)
      make.height.equalTo(self.logoImageView.snp.width).multipliedBy(29 / 200.0)
    }
    
    self.usernameTextField.snp.makeConstraints { make in
      make.top.equalTo(self.logoImageView.snp.bottom).offset(46)
      make.left.equalTo(16)
      make.right.equalTo(-16)
      make.height.equalTo(54)
    }

    self.passwordTextField.snp.makeConstraints { make in
      make.top.equalTo(self.usernameTextField.snp.bottom).offset(16)
      make.left.right.height.equalTo(self.usernameTextField)
    }
    
    self.loginButton.snp.makeConstraints { make in
      make.top.equalTo(self.passwordTextField.snp.bottom).offset(16)
      make.left.right.height.equalTo(self.usernameTextField)
    }
    
    self.registerButton.snp.makeConstraints { make in
      make.top.equalTo(self.loginButton.snp.bottom).offset(16)
      make.left.right.height.equalTo(self.usernameTextField)
    }
  }
  
  // MARK: Actions
  
  @objc func loginButtonDidTap() {
    guard let username = self.usernameTextField.text, !username.isEmpty else { return }
    guard let password = self.passwordTextField.text, !password.isEmpty else { return }
    
    print("username : \(username)")
    print("password : \(password)")
    
    AuthService.login(username: username, password: password) { response in
      switch response.result {
      case .failure(let error):
        print("로그인 실패")
        print(error)
      case .success(let value):
        print("로그인 성공")
        print(value)
      }
      
    }
  }
  
}
