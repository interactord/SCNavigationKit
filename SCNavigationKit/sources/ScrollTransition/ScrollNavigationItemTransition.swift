////
////  ImageScrollableConstant.swift
////  SCNavigationKit
////
////  Created by Scott Moon on 24/05/2019.
////  Copyright © 2019 Scott Moon. All rights reserved.
////
//
//import UIKit
//
//public protocol ScrollNavigationItemTransition {
//  var scrollNavigationState: ScrollNavigationState { get }
//  var shoudResize: Bool? { get set }
//  var toolbarItemRightView: UIView { get }
//}
//
//extension ScrollNavigationItemTransition where Self: UIViewController {
//
//  public func addRightBarButton() {
//    guard let navigationBar = self.navigationController?.navigationBar else {
//      return
//    }
//    self.navigationController?.navigationBar.prefersLargeTitles = true
//    navigationBar.addSubview(toolbarItemRightView)
//
//    toolbarItemRightView.translatesAutoresizingMaskIntoConstraints = false
//    NSLayoutConstraint.activate([
//      toolbarItemRightView.rightAnchor.constraint(
//        equalTo: navigationBar.rightAnchor,
//        constant: -scrollNavigationState.viewMarginState.right
//      ),
//      toolbarItemRightView.bottomAnchor.constraint(
//        equalTo: navigationBar.bottomAnchor,
//        constant: -scrollNavigationState.viewMarginState.bottom
//      ),
//      toolbarItemRightView.heightAnchor.constraint(
//        equalToConstant: scrollNavigationState.viewSizeState.largeSize.height
//      ),
//      toolbarItemRightView.widthAnchor.constraint(
//        equalToConstant: scrollNavigationState.viewSizeState.largeSize.width
//      )
//    ])
//  }
//
//  public func animatedItem() {
//    guard let shoudResize = shoudResize else {
//      assertionFailure("shoulResize wasn't set. reason could be non-handled device orientation state")
//      return
//    }
//
//    if shoudResize {
//      moveAndResizeImageForPortrait()
//    }
//  }
//
//  public func showImage(_ show: Bool) {
//    UIView.animate(withDuration: 0.2) {
//      self.toolbarItemRightView.alpha = show ? 1.0 : 0.0
//    }
//  }
//
//  public func resizeImageForLandscape() {
//    let largeSizeHeight = scrollNavigationState.viewSizeState.largeSize.height
//    toolbarItemRightView.transform = largeSizeHeight.resizeLandscapeTransform(landscapeScale: landScapeScaleState.scaleForImageSize)
//  }
//
//  public func moveAndResizeImageForPortrait() {
//    guard let height = self.navigationController?.navigationBar.frame.height else {
//      return
//    }
//
//    let coeff = height.getCoefficient(navigationBarState: scrollNavigationState.navigationBarState)
//    let
//  }
//}
