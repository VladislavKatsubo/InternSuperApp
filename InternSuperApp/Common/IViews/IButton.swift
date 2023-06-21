//
//  IButton.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 20.06.23.
//

import UIKit

class IButton: UIButton {

    var onTap: (() -> Void)?

    // MARK: - Init
    init() {
        super.init(frame: .zero)
        didLoad()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public methods
    func didLoad() {
        addTarget(self, action: #selector(didTap), for: .touchUpInside)
    }
}

private extension IButton {
    @objc
    func didTap() {
        onTap?()
    }
}
