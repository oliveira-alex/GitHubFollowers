//
//  SearchViewController.swift
//  GitHubFollowers
//
//  Created by Alex Oliveira on 01/02/2022.
//

import UIKit

class SearchViewController: UIViewController {
    let logoImageView = UIImageView()
    let usernameTextField = GFTextField()
    let callToActionButton = GFButton(color: .systemGreen, title: "Get Followers", systemImageName: "person.3")

    var isUsernameEntered: Bool { return usernameTextField.text!.isEmpty == false }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubviews(logoImageView, usernameTextField, callToActionButton)
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
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }

    @objc func pushFollowerListViewController() {
        guard isUsernameEntered else {
            presentGFAlert(
                title: "Empty Username",
                message: "Please enter a username. We need to know who to look for 😀.",
                buttonTitle: "OK"
            )
            return
        }

        usernameTextField.resignFirstResponder()

        let followerListViewController = FollowerListViewController(username: usernameTextField.text!)
        navigationController?.pushViewController(followerListViewController, animated: true)
    }

    func configureLogoImageView() {
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = Images.ghLogo

        let topConstraintConstant: CGFloat = (DeviceTypes.isiPhoneSE || DeviceTypes.isiPhone8Zoomed) ? 20 : 80

        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: topConstraintConstant),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }

    func configureTextField() {
        usernameTextField.delegate = self

        let padding: CGFloat = 50
        let topConstraintConstant: CGFloat = (DeviceTypes.isiPhoneSE || DeviceTypes.isiPhone8Zoomed) ? 20 : padding

        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: topConstraintConstant),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            usernameTextField.heightAnchor.constraint(equalToConstant: padding)
        ])
    }

    func configureCallToActionButton() {
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
