//
//  TaskSectionsTableView.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 23.07.23.
//

import UIKit

final class TaskSectionsTableView: IView {

    private enum Constants {
        static let sectionHeaderFont: UIFont = .systemFont(ofSize: 18, weight: .bold)
    }

    private let tableView = ITableView(style: .insetGrouped)

    private var taskSections: [IInnowiseTaskSection] = []

    var onTap: ((InnowiseTaskProtocol) -> Void)?

    // MARK: - Lifecycle
    override func didLoad() {
        super.didLoad()
        setupTableView()
    }

    // MARK: - Configure
    func configure(with taskSections: [IInnowiseTaskSection]) {
        self.taskSections = taskSections
        self.tableView.reloadData()
    }
}

private extension TaskSectionsTableView {
    // MARK: - Private methods
    func setupTableView() {
        addSubview(tableView)
        tableView.registerCells([TaskSectionsTableViewCell.self])
        tableView.registerHeadersFooters([TaskSectionsTableViewSectionHeader.self])
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.isScrollEnabled = true
        tableView.dataSource = self
        tableView.delegate = self

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}

extension TaskSectionsTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = taskSections[indexPath.section].tasks[indexPath.row]

        self.onTap?(task)
    }
}

extension TaskSectionsTableView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        self.taskSections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.taskSections[section].tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TaskSectionsTableViewCell.reuseID, for: indexPath) as? TaskSectionsTableViewCell else {
            return .init()
        }

        let taskSectionTitle = String(indexPath.row + 1) + ". " + taskSections[indexPath.section].tasks[indexPath.row].title
        cell.configure(with: taskSectionTitle)

        return cell
    }

    // MARK: Header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = TaskSectionsTableViewSectionHeader()
        let title = taskSections[section].title

        headerView.configure(with: title)

        return headerView
    }
}
