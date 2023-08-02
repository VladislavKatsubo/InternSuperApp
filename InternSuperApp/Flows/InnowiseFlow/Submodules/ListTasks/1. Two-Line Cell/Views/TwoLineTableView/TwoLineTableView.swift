//
//  TwoLineTableView.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 2.08.23.
//

import UIKit

final class TwoLineTableView: IView {

    private enum Constants {
        static let rowHeight: CGFloat = 72.0
    }

    private let tableView = ITableView(style: .plain)

    var userModels: [TwoLineTableViewCell.Model] = []

    // MARK: - Lifecycle
    override func didLoad() {
        setupItems()
    }

    // MARK: - Configure
    func configure(with models: [TwoLineTableViewCell.Model]) {
        self.userModels = models
        self.tableView.reloadData()
    }
}

private extension TwoLineTableView {
    // MARK: - Private methods
    func setupItems() {
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.registerCells([TwoLineTableViewCell.self])
        tableView.delegate = self
        tableView.dataSource = self

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}

extension TwoLineTableView: UITableViewDataSource {
    // MARK: - TableView DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.userModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TwoLineTableViewCell.reuseID, for: indexPath) as? TwoLineTableViewCell else {
            return .init()
        }
        
        let model = self.userModels[indexPath.row]

        cell.configure(with: model)

        return cell
    }
}

extension TwoLineTableView: UITableViewDelegate {
    // MARK: - TableView Delegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.rowHeight
    }
}
