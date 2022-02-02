//
//  FollowerListViewController.swift
//  GitHubFollowers
//
//  Created by Alex Oliveira on 02/02/2022.
//

import UIKit

class FollowerListViewController: UIViewController {
    var username: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
