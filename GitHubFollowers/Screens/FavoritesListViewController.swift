//
//  FavoritesListViewController.swift
//  GitHubFollowers
//
//  Created by Alex Oliveira on 01/02/2022.
//

import UIKit

class FavoritesListViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue

        PersistenceManager.retrieveFavorites { result in
            switch result {
            case .success(let favorites):
                print(favorites)
            case .failure(let error):
                break
            }
        }
    }
}
