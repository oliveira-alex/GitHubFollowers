//
//  GFAvatarImageView.swift
//  GitHubFollowers
//
//  Created by Alex Oliveira on 05/02/2022.
//

import UIKit

class GFAvatarImageView: UIImageView {
    let cache = NetworkManager.shared.cache
    let placeholderImage = Images.placeholder

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure() {
        layer.cornerRadius = 10
        clipsToBounds = true
        image = placeholderImage
        translatesAutoresizingMaskIntoConstraints = false
    }

    func downloadImage(fromURL url: String) {
        Task {
            let image = await NetworkManager.shared.downloadImage(from: url)
            self.image = image ?? placeholderImage
        }
    }
}
