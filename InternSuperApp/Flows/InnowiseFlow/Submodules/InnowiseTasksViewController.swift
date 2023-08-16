//
//  InnowiseTasksViewController.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 23.07.23.
//

import UIKit

final class InnowiseTasksViewController: UIViewController {

    typealias Constants = InnowiseTasksResources.Constants.UI

    private let tableView = TaskSectionsTableView()

    private var viewModel: InnowiseTasksViewModelProtocol?

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupItems()
        setupViewModel()
    }

    // MARK: - Configure
    func configure(viewModel: InnowiseTasksViewModelProtocol) {
        self.viewModel = viewModel
    }
}

private extension InnowiseTasksViewController {
    // MARK: - Private methods
    func setupViewModel() {
        viewModel?.onStateChange = { [weak self] state in
            guard let self = self else { return }

            switch state {

            case .onTaskSectionsTableView(let sections):
                self.tableView.configure(with: sections)
            }
        }

        viewModel?.launch()
    }

    func setupItems() {
        self.title = Constants.title
        self.view.backgroundColor = .secondarySystemBackground
        self.navigationController?.navigationBar.prefersLargeTitles = true

        setupTaskSectionsTableView()
    }

    func setupTaskSectionsTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false

        tableView.onTap = { [weak self] taskSection in
            self?.viewModel?.didTap(at: taskSection)
        }

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
