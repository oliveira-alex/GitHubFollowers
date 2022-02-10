//
//  UITableView+Ext.swift
//  GitHubFollowers
//
//  Created by Alex Oliveira on 10/02/2022.
//

import UIKit

extension UITableView {
    func reloadDataOnMainThread() {
        DispatchQueue.main.async { self.reloadData() }
    }

    func removeExcessCells() {
        tableFooterView = UIView(frame: .zero)
    }
}
