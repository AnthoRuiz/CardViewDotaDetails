//
//  UICollectionViewExt.swift
//  CardViewDotaDetails
//
//  Created by Anthony Ruiz on 3/26/18.
//  Copyright © 2018 Jakaboy. All rights reserved.
//

import Foundation
import UIKit
extension UICollectionViewCell{
   func shadow(){
      self.contentView.layer.cornerRadius = 4.0
      self.contentView.layer.borderWidth = 1.0
      self.contentView.layer.borderColor = UIColor.clear.cgColor
      self.contentView.layer.masksToBounds = false
      self.layer.shadowColor = UIColor.gray.cgColor
      self.layer.shadowOffset = CGSize(width: 0, height: 1.0)
      self.layer.shadowRadius = 4.0
      self.layer.shadowOpacity = 1.0
      self.layer.masksToBounds = false
      self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath
   }
}
