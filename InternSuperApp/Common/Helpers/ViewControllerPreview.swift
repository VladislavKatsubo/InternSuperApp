//
//  ViewControllerPreview.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 23.06.23.
//

import UIKit
import SwiftUI

struct ViewControllerPreview: UIViewControllerRepresentable {

    let viewControllerBuilder: () -> UIViewController

    init(_ viewControllerBuilder: @escaping () -> UIViewController) {
        self.viewControllerBuilder = viewControllerBuilder
    }

    func makeUIViewController(context: Context) -> some UIViewController {
        return viewControllerBuilder()
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}
