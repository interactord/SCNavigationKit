//
//  NavigationRightBarButton.swift
//  SCNavigationKit
//
//  Created by Scott Moon on 24/05/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import UIKit

public protocol ScrollAnimatedBarButton {
  associatedtype View

  var large: NavigationBarButtonState { get }
  var small: NavigationBarButtonState { get }
  var landscapeScale: CGFloat { get }
  var view: View { get }
}

extension ScrollAnimatedBarButton {

  public func insertView(to navigationController: UINavigationController?) {
    navigationController?.navigationBar.prefersLargeTitles = true

    guard
      let navigationBar = navigationController?.navigationBar,
      let view = view as? UIView
      else { return }

    navigationBar.addSubview(view)
    view.translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activate([
      view.rightAnchor.constraint(
        equalTo: navigationBar.rightAnchor,
        constant: -large.margin.right
      ),
      view.bottomAnchor.constraint(
        equalTo: navigationBar.bottomAnchor,
        constant: -large.margin.bottom
      ),
      view.widthAnchor.constraint(
        equalToConstant: large.size.width
      ),
      view.heightAnchor.constraint(
        equalToConstant: large.size.height
      )
    ])
  }

  public func scrollAnimated(to navigationController: UINavigationController?) {

    guard
      let height = navigationController?.navigationBar.frame.height,
      let view = view as? UIView
      else { return }

    let coeff: CGFloat = {
      let delta = height - small.navigationHeight
      let heightDifferenceBetweenStates = large.navigationHeight - small.navigationHeight
      return delta / heightDifferenceBetweenStates
    }()

    let factor = small.size.height / large.size.height

    let scale: CGFloat = {
      let sizeAddendumFactor = coeff * (1.0 - factor)
      return min(1.0, sizeAddendumFactor + factor)
    }()

    // Value of difference between icons for large and small states
    let sizeDiff = large.size.height * (1.0 - factor) // 8.0

    let yTranslation: CGFloat = {
      /// This value = 14. It equals to difference of 12 and 6 (bottom margin for large and small states). Also it adds 8.0 (size difference when the image gets smaller size)
      let maxYTranslation = large.margin.bottom - small.margin.bottom + sizeDiff
      return max(0, min(maxYTranslation, (maxYTranslation - coeff * (small.margin.bottom + sizeDiff))))
    }()

    let xTranslation = max(0, sizeDiff - coeff * sizeDiff)

    view.transform = CGAffineTransform.identity
      .scaledBy(x: scale, y: scale)
      .translatedBy(x: xTranslation, y: yTranslation)

  }
}
