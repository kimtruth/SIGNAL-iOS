//
//  MeetingCardCell.swift
//  Signal
//
//  Created by Truth on 2017. 12. 7..
//  Copyright © 2017년 k1mtruth. All rights reserved.
//

import UIKit

class MeetingCardCell: UICollectionViewCell {
  
  // MARK: Constants
  
  fileprivate struct Metric {
    static let cardViewMargin = 16.f
    static let cardViewHeight = 200.f
    
    static let profileImageViewTop = 12.f
    static let profileImageViewLeft = 16.f
    static let profileImageViewSize = 36.f
    
    static let nameLabelTop = 21.f
    static let nameLabelLeft = 12.f
  }
  
  fileprivate struct Font {
    static let nameLabel = UIFont.systemFont(ofSize: 17, weight: .semibold)
  }
  
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
  fileprivate let profileImageView = UIImageView().then {
    $0.layer.cornerRadius = Metric.profileImageViewSize / 2.f
    $0.clipsToBounds = true
  }
  fileprivate let nameLabel = UILabel().then {
    $0.font = Font.nameLabel
  }
  fileprivate let contentLabel = UILabel().then {
    $0.numberOfLines = 2
  }
  
  // Mark: Initializing
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.cardView.addSubview(self.profileImageView)
    self.cardView.addSubview(self.contentLabel)
    self.cardView.addSubview(self.nameLabel)
    self.contentView.addSubview(cardView)
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: Configuring
  
  func configure(meeting: Meeting) {
    self.backgroundColor = .white
    self.contentLabel.text = meeting.content
    self.nameLabel.text = "이름"
    self.layoutSubviews()
  }
  
  // MARK: Layout
  
  override func layoutSubviews() {
    super.layoutSubviews()
    guard let user = user else { return }
    self.cardView.top = Metric.cardViewMargin
    self.cardView.left = Metric.cardViewMargin
    self.cardView.width = self.contentView.width - Metric.cardViewMargin * 2
    self.cardView.height = Metric.cardViewHeight
    
    self.cardView.layer.shadowPath = UIBezierPath(roundedRect: self.cardView.bounds, cornerRadius: 2).cgPath
    
    self.profileImageView.left = Metric.profileImageViewLeft
    self.profileImageView.top = Metric.profileImageViewTop
    self.profileImageView.width = Metric.profileImageViewSize
    self.profileImageView.height = Metric.profileImageViewSize
    
    print(AuthService.mediaUrl(user.profileImagePath))
    self.profileImageView.backgroundColor = .lightGray
    self.profileImageView.kf.setImage(with: URL(string: AuthService.mediaUrl(user.profileImagePath)))
    
    self.nameLabel.left = self.profileImageView.right + Metric.nameLabelLeft
    self.nameLabel.top = Metric.nameLabelTop
    self.nameLabel.sizeToFit()
    
    self.contentLabel.top = 100
    self.contentLabel.width = self.cardView.width
    self.contentLabel.sizeToFit()
  }
}
