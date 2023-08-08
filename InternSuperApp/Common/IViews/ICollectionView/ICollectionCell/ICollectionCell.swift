//
//  ICollectionCell.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 7.08.23.
//

import UIKit

class ICollectionCell: UICollectionViewCell {

    // MARK: - Constants
    private enum Constants {

    }

    static var reuseID: String { String(describing: self) }

    var horizontalFittingPriority: UILayoutPriority { .required }
    var verticalFittingPriority: UILayoutPriority { .required }

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        didLoad()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public methods
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        let size = super.systemLayoutSizeFitting(targetSize, withHorizontalFittingPriority: horizontalFittingPriority, verticalFittingPriority: verticalFittingPriority)
        return CGSize(width: max(size.width, intrinsicContentSize.width), height: max(size.height, intrinsicContentSize.height))
    }

    func didLoad() {

    }
}
