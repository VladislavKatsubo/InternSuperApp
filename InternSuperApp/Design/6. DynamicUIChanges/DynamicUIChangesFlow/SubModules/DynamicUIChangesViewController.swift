//
//  DynamicUIChangesViewController.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 28.06.23.
//

import UIKit

final class DynamicUIChangesViewController: UIViewController {

    typealias Constants = DynamicUIChangesResources.Constants.UI

    private let button = AnimatedGradientButton()

    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        setupItems()
    }
}

private extension DynamicUIChangesViewController {
    // MARK: - Private methods
    func setupItems() {
        view.backgroundColor = .systemBackground

        setupHideShowButton()
    }

    func setupHideShowButton() {
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configure(with: "Hide/Show")

        button.onTap = { [weak self] in
            let vc = HideShowFactory().createController()
            
            self?.navigationController?.pushViewController(vc, animated: true)
        }

        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 150.0),
            button.heightAnchor.constraint(equalToConstant: 50.0),
        ])
    }
}
