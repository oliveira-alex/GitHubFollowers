//
//  GFFollowersItemViewController.swift
//  GitHubFollowers
//
//  Created by Alex Oliveira on 07/02/2022.
//

import UIKit

protocol GFFollowersItemViewControllerDelegate: AnyObject {
    func didTapGetFollowers(for user: User)
}

class GFFollowersItemViewController: GFItemInfoViewController {
    weak var delegate: GFFollowersItemViewControllerDelegate!

    init(user: User, delegate: GFFollowersItemViewControllerDelegate) {
        super.init(user: user)
        self.delegate = delegate
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }

    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .followers, withCount: user.followers)
        itemInfoViewTwo.set(itemInfoType: .following, withCount: user.following)
        actionButton.set(color: .systemGreen, title: "Get Followers", systemImageName: "person.3")
    }

    override func actionButtonTapped() {
        delegate.didTapGetFollowers(for: user)
    }
}
