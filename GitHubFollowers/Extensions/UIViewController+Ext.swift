//
//  UIViewController+Ext.swift
//  GitHubFollowers
//
//  Created by Alex Oliveira on 02/02/2022.
//

import UIKit
import SafariServices

extension UIViewController {
    func presentGFAlert(title: String, message: String, buttonTitle: String) {
        let alertViewController = GFAlertViewController(title: title, message: message, buttonTitle: buttonTitle)
        alertViewController.modalPresentationStyle = .overFullScreen
        alertViewController.modalTransitionStyle = .crossDissolve
        self.present(alertViewController, animated: true)
    }

    func presentDefaultError() {
        let alertViewController = GFAlertViewController(title: "Something went wrong",
                                                        message: "We were unable to complete your task at this time. Please try again.",
                                                        buttonTitle: "OK")
        alertViewController.modalPresentationStyle = .overFullScreen
        alertViewController.modalTransitionStyle = .crossDissolve
        self.present(alertViewController, animated: true)
    }

    func presentSafariViewController(with url: URL) {
        let safariViewController = SFSafariViewController(url: url)
        safariViewController.preferredControlTintColor = .systemGreen
        present(safariViewController, animated: true)
    }
}
