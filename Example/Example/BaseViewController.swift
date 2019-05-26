//
//  BaseViewController.swift
//  Example
//
//  Created by Scott Moon on 24/05/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

  // MARK: - Private

  private var didSetupConstraints = false

  // MARK: - Initializing

  convenience init() {
    self.init(nibName: nil, bundle: nil)
  }

  required convenience init?(coder aDecoder: NSCoder) {
    self.init()
  }

  // MARK: - Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()
    self.setupNavigation()
    self.setupViews()
    self.view.setNeedsUpdateConstraints()
    self.view.backgroundColor = .white
  }

  func setupNavigation() {
    if false == self.didSetupConstraints {
      self.setupConstraints()
      self.didSetupConstraints = true
    }
    super.updateViewConstraints()
  }

  func setupViews() {
  }

  func setupConstraints() {
  }

}
