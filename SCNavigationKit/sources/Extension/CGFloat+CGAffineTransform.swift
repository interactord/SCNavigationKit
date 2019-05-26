//
//  CGFloat+Converter.swift
//  SCNavigationKit
//
//  Created by Scott Moon on 24/05/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import Foundation

extension CGFloat {
  func resizeLandscapeTransform(landscapeScale: CGFloat) -> CGAffineTransform {
    let yTranslation = self * landscapeScale
    return CGAffineTransform.identity
      .scaledBy(x: landscapeScale, y: landscapeScale)
      .translatedBy(x: 0, y: yTranslation)
  }
}
