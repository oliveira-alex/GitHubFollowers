//
//  GFButton.swift
//  GitHubFollowers
//
//  Created by Alex Oliveira on 01/02/2022.
//

import UIKit

class GFButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    convenience init(color: UIColor, title: String, systemImageName: String) {
        self.init(frame: .zero)
        set(color: color, title: title, systemImageName: systemImageName)
    }

    private func configure() {
        configuration = .tinted()
        configuration?.cornerStyle = .medium
        configuration?.imagePlacement = .leading
        configuration?.imagePadding = 6

        translatesAutoresizingMaskIntoConstraints = false
    }

    func set(color: UIColor, title: String, systemImageName: String) {
        configuration?.baseBackgroundColor = color
        configuration?.baseForegroundColor = color
        configuration?.title = title
        configuration?.image = UIImage(systemName: systemImageName)
    }
}
