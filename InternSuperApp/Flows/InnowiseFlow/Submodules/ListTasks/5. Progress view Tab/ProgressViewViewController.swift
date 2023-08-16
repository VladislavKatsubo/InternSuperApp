//
//  ProgressViewViewController.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 15.08.23.
//

import UIKit

final class ProgressViewViewController: UIViewController {

    typealias Constants = ProgressViewResources.Constants.UI

    private let tableView = ProgressViewTableView()
    private let progressView = ProgressView()
    private let emptyView = ContentUnavailableView()

    private var viewModel: ProgressViewViewModelProtocol?

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupItems()
        setupViewModel()
    }

    // MARK: - Configure
    func configure(viewModel: ProgressViewViewModelProtocol) {
        self.viewModel = viewModel
    }
}

private extension ProgressViewViewController {
    // MARK: - Private methods
    func setupViewModel() {
        viewModel?.onStateChange = { [weak self] state in
            guard let self = self else { return }

            switch state {
            case .onMockLoad(let interval):
                self.progressView.isHidden = false
                self.progressView.configure(with: interval)
                self.navigationItem.rightBarButtonItem?.isEnabled = false
            case .onProgressViewTableViewData(let models, let imageManager):
                self.tableView.configure(with: models, imageManager: imageManager)
                self.progressView.isHidden = true
                self.navigationItem.rightBarButtonItem?.isEnabled = true
            case .onProgressViewTableViewRemoveData:
                self.tableView.removeData()
            case .onShowEmptyView(let model):
                self.emptyView.configure(with: model)
                self.emptyView.isHidden = false
                self.navigationItem.rightBarButtonItem?.isEnabled = false
            case .onHideEmptyView:
                self.emptyView.isHidden = true
            }
        }
        viewModel?.launch()
    }

    func setupItems() {
        self.title = Constants.title
        self.view.backgroundColor = .systemBackground

        setupTableView()
        setupProgressView()
        setupNavBar()
        setupEmptyView()
    }

    func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.onPullToRefresh = { [weak self] in
            self?.viewModel?.didPullToRefresh()
        }

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }

    func setupProgressView() {
        view.addSubview(progressView)
        progressView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            progressView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            progressView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            progressView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            progressView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }

    func setupNavBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .trash,
            target: self,
            action: #selector(didTapRefreshButton)
        )
        navigationItem.rightBarButtonItem?.isEnabled = false
    }

    @objc
    func didTapRefreshButton() {
        self.viewModel?.didTapRefreshButton()
    }

    func setupEmptyView() {
        tableView.addSubview(emptyView)
        emptyView.translatesAutoresizingMaskIntoConstraints = false
        emptyView.isHidden = true

        emptyView.onPullToRefresh = { [weak self] in
            self?.viewModel?.didPullToRefresh()
        }

        NSLayoutConstraint.activate([
            emptyView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            emptyView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            emptyView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            emptyView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
