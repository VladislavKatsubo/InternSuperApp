//
//  ColorSwitcherView.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 6.07.23.
//

import UIKit

final class ColorSwitcherView: IView, UIPickerViewDelegate, UIPickerViewDataSource {

    private enum Constants {
        static let rotationAngle: CGFloat = -(.pi / 2)
        static let labelFont: UIFont = .systemFont(ofSize: 14.0, weight: .regular)
    }

    private var colors: [String] = []
    private let pickerView = UIPickerView()

    private var selectedColorIndex = 0

    var onTap: ((Int) -> Void)?

    // MARK: - Lifecycle
    override func didLoad() {
        super.didLoad()
        setupItems()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        clearPickerViewBackground()
    }

    // MARK: - Configure
    func configure(with colors: [String]) {
        self.colors = colors
        pickerView.reloadAllComponents()
    }

    func changeColor(with index: inout Int) {
        pickerView.selectRow(index, inComponent: 0, animated: true)
    }
}

private extension ColorSwitcherView {
    // MARK: - Private methods
    func setupItems() {
        pickerView.transform = CGAffineTransform(rotationAngle: Constants.rotationAngle)
        pickerView.delegate = self
        pickerView.dataSource = self
        addSubview(pickerView)

        pickerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pickerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            pickerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            pickerView.topAnchor.constraint(equalTo: topAnchor),
            pickerView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}

extension ColorSwitcherView {
    // MARK: - UIPickerViewDelegate
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return colors.count
    }

    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return bounds.width / 3.0
    }

    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return bounds.width
    }

    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var label: UILabel

        if let view = view as? UILabel {
            label = view
        } else {
            label = UILabel()
        }

        label.text = colors[row]
        label.textAlignment = .center
        label.numberOfLines = .zero
        label.font = Constants.labelFont

        label.transform = CGAffineTransform(rotationAngle: .pi / 2)

        return label
    }

    // MARK: - UIPickerViewDataSource
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.onTap?(row)
    }

    func clearPickerViewBackground() {
        pickerView.subviews.forEach {
            if $0.frame.height > 1.0 {
                $0.backgroundColor = .clear
            }
        }
    }
}
