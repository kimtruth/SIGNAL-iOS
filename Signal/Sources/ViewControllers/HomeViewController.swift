//
//  HomeViewController.swift
//  Signal
//
//  Created by Truth on 2017. 12. 7..
//  Copyright © 2017년 k1mtruth. All rights reserved.
//

import UIKit

import Alamofire

final class HomeViewController: UIViewController {
  
  // Mark: UI
  
  fileprivate let collectionView = UICollectionView(frame: .zero, collectionViewLayout:
    UICollectionViewFlowLayout())
  
  // Mark: Properties
  
  fileprivate var meetings: [Meeting] = []
  fileprivate var publishers: [User] = []
  
  // Mark: View Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.collectionView.backgroundColor = .white
    self.collectionView.frame = self.view.bounds
    self.collectionView.dataSource = self
    self.collectionView.delegate = self
    self.collectionView.register(MeetingCardCell.self, forCellWithReuseIdentifier: "cardCell")
    self.view.addSubview(self.collectionView)
    self.fetchFollowings()
    self.fetchMeetings()
  }
  
  // MARK: Networking
  
  fileprivate func fetchFollowings() {
    guard let token = user?.token else { return }
    
    let headers: HTTPHeaders = [
      "Authorization": token,
      ]
    let urlString = "http://52.79.36.12:7504/account/following"
    Alamofire
      .request(urlString, method: .get, headers: headers)
      .validate(statusCode: 200..<400)
      .responseJSON { response in
        switch response.result {
        case .failure(let error):
          print("미팅 로드 실패")
          print(error)
        case .success(let value):
          guard let postsJSONArray = value as? [[String: Any]] else { return }
          print(postsJSONArray)
          self.publishers = [User](JSONArray: postsJSONArray)
          print("Followings : \(self.publishers)")
          
          self.collectionView.reloadData()
        }
    }
  }
  
  fileprivate func fetchMeetings() {
    let urlString = "http://52.79.36.12:7504/meeting/4"
    Alamofire
      .request(urlString, method: .get)
      .validate(statusCode: 200..<400)
      .responseJSON { response in
        switch response.result {
        case .failure(let error):
          print("미팅 로드 실패")
          print(error)
        case .success(let value):
          guard let postsJSONArray = value as? [[String: Any]] else { return }
          self.meetings = [Meeting](JSONArray: postsJSONArray)
          print("Meetings : \(self.meetings)")
          
          self.collectionView.reloadData()
        }
    }
  }
  
}


// Mark: - UICollectionViewDataSource

extension HomeViewController: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return self.meetings.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cardCell", for: indexPath) as! MeetingCardCell
    cell.configure(meeting: self.meetings[indexPath.item])
    return cell
  }
  
}


// Mark: - UICollectionViewFlowLayout
extension HomeViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let cellWidth = collectionView.frame.width
    return CGSize(width: cellWidth, height: cellWidth)
  }
}
