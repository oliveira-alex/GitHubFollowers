//
//  SearchViewController.swift
//  GitHubFollowers
//
//  Created by Alex Oliveira on 01/02/2022.
//

import UIKit

class SearchViewController: UIViewController {
    let logoImageView = UIImageView()
    let userNameTextField = GFTextField()
    let callToActionButton = GFButton(backgroundColor: .systemGreen, title: "Get Followers")

    var isUsernameEntered: Bool { return userNameTextField.text!.isEmpty == false }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureLogoImageView()
        configureTextField()
        configureCallToActionButton()
        createDismissKeyboardTapGesture()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

    func createDismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }

    @objc func pushFollowerListViewController() {
        guard isUsernameEntered else {
            presentGFAlertOnMainThread(
                title: "Empty Username",
                message: "Please enter a username. We need to know who to look for 😀.",
                buttonTitle: "OK"
            )
            return
        }

        let followerListViewController = FollowerListViewController()
        followerListViewController.username = userNameTextField.text
        followerListViewController.title = userNameTextField.text
        navigationController?.pushViewController(followerListViewController, animated: true)
    }

    func configureLogoImageView() {
        view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "gh-logo")!

        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }

    func configureTextField() {
        view.addSubview(userNameTextField)
        userNameTextField.delegate = self
        #warning("remove test user later")
        userNameTextField.text = "oliveira-alex" /// <- test user

        let padding: CGFloat = 50

        NSLayoutConstraint.activate([
            userNameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: padding),
            userNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            userNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            userNameTextField.heightAnchor.constraint(equalToConstant: padding)
        ])
    }

    func configureCallToActionButton() {
        view.addSubview(callToActionButton)
        callToActionButton.addTarget(self, action: #selector(pushFollowerListViewController), for: .touchUpInside)

        let padding: CGFloat = 50

        NSLayoutConstraint.activate([
            callToActionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -padding),
            callToActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            callToActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            callToActionButton.heightAnchor.constraint(equalToConstant: padding)
        ])
    }
}

extension SearchViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFollowerListViewController()
        return true
    }
}
