//
//  ViewController.swift
//  Example
//
//  Created by Scott Moon on 24/05/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import UIKit

import SCNavigationKit

class ViewController: BaseViewController {

  var tableView = UITableView(frame: .zero)

  lazy var rightBarButton = RightBarButton()

  override func setupViews() {
    super.setupViews()

    tableView.dataSource = self
    tableView.delegate = self
    view = tableView
  }

  override func setupNavigation() {
    super.setupNavigation()
    self.title = "SAMPLE TITLE"

  }

  override func setupConstraints() {
    super.setupConstraints()
    rightBarButton.insertView(to: self.navigationController)
  }

  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    rightBarButton.scrollAnimated(to: self.navigationController)
  }
}

extension ViewController: UITableViewDataSource {

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 100
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell()
    cell.textLabel?.text = "Lerem ipum"
    return cell
  }
}

extension ViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 50
  }
}
