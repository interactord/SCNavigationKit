//
//  RIghtBarButton.swift
//  Example
//
//  Created by Scott Moon on 24/05/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import UIKit

import SCNavigationKit

struct RightBarButton: ScrollAnimatedBarButton {

  var landscapeScale: CGFloat = 0.5

  var large: NavigationBarButtonState = {
    var state = NavigationBarButtonState()
    state.size = CGSize(width: 60, height: 60)
    state.margin = UIEdgeInsets(top: 0, left: 0, bottom: 12, right: 16)
    state.navigationHeight = 96.5
    return state
  }()

  var small: NavigationBarButtonState = {
    var state = NavigationBarButtonState()
    state.size = CGSize(width: 32, height: 32)
    state.margin = UIEdgeInsets(top: 0, left: 0, bottom: 6, right: 16)
    state.navigationHeight = 44
    return state
  }()

  let view: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("button", for: .normal)
    button.backgroundColor = .red
    return button
  }()

}
