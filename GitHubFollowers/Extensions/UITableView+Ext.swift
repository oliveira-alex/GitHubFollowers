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

    /// Removes empty rows from the bottom of a table view
    func removeExcessCells() {
        tableFooterView = UIView(frame: .zero)
    }
}
