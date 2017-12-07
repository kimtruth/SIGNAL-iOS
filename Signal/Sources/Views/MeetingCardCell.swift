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
  fileprivate let contentLabel = UILabel().then {
    $0.numberOfLines = 2
  }
  
  // Mark: Initializing
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.contentView.addSubview(contentLabel)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configure(meeting: Meeting) {
    self.backgroundColor = .lightGray
    self.contentLabel.text = meeting.content
    self.layoutSubviews()
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    self.contentLabel.frame.size.width = self.contentView.frame.width
    self.contentLabel.sizeToFit()
  }
}
