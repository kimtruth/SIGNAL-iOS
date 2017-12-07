//
//  MeetingCardCell.swift
//  Signal
//
//  Created by Truth on 2017. 12. 7..
//  Copyright © 2017년 k1mtruth. All rights reserved.
//

import UIKit


class MeetingCardCell: UICollectionViewCell {
  
  // Mark: UI
  
  fileprivate let cardView = UIView().then {
    $0.backgroundColor = .white
    $0.layer.borderColor = UIColor(red: 199.0 / 255.0, green: 202.0 / 255.0, blue: 209.0 / 255.0, alpha: 1.0).cgColor
    $0.layer.borderWidth = 1.0
    $0.layer.cornerRadius = 2.0
    $0.layer.shadowColor = UIColor.black.cgColor
    $0.layer.shadowOffset = CGSize(width: 0, height: 0)
    $0.layer.shadowRadius = 8.0
    $0.layer.shadowOpacity = 0.1
  }
  fileprivate let contentLabel = UILabel().then {
    $0.numberOfLines = 2
  }
  
  // Mark: Initializing
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.cardView.addSubview(self.contentLabel)
    self.contentView.addSubview(cardView)
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: Configuring
  
  func configure(meeting: Meeting) {
    self.backgroundColor = .white
    self.contentLabel.text = meeting.content
    self.layoutSubviews()
  }
  
  // MARK: Layout
  
  override func layoutSubviews() {
    super.layoutSubviews()
    self.cardView.top = 16
    self.cardView.left = 16
    self.cardView.width = self.contentView.width - 32
    self.cardView.height = self.contentView.width - 32
    self.cardView.layer.shadowPath = UIBezierPath(roundedRect: self.cardView.bounds, cornerRadius: 2).cgPath
    
    self.contentLabel.width = self.cardView.width
    self.contentLabel.sizeToFit()
  }
}
