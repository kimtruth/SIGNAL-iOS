//
//  BorderedTextField.swift
//  Signal
//
//  Created by Truth on 2017. 11. 12..
//  Copyright © 2017년 k1mtruth. All rights reserved.
//

import UIKit

final class BorderedTextField: UITextField {

  fileprivate let inset: CGFloat = 16
  
  // MARK: Initializing
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    self.borderStyle = .none
    self.layer.borderColor = UIColor(red:0.78, green:0.79, blue:0.82, alpha:1.0).cgColor
    self.layer.borderWidth = 1
    self.layer.cornerRadius = 2
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: Padding
  
  override func textRect(forBounds bounds: CGRect) -> CGRect {
    return bounds.insetBy(dx: inset, dy: 0)
  }
  
  override func editingRect(forBounds bounds: CGRect) -> CGRect {
    return textRect(forBounds: bounds)
  }
}
