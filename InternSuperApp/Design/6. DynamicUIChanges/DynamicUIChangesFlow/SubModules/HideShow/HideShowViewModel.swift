//
//  HideShowViewModel.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 28.06.23.
//

import UIKit

protocol HideShowViewModelProtocol {
    var onStateChange: ((HideShowResources.State) -> Void)? { get set }

    func launch()
}

final class HideShowViewModel: HideShowViewModelProtocol {

    typealias Constants = HideShowResources.Constants.Mocks

    private let imageManager: ImageManagerProtocol

    var onStateChange: ((HideShowResources.State) -> Void)?

    // MARK: - Init
    init(imageManager: ImageManagerProtocol) {
        self.imageManager = imageManager
    }

    // MARK: - Public methods
    func launch() {
        setupModels()
    }
}

private extension HideShowViewModel {
    // MARK: - Private methods
    func setupModels() {
        setupImageView()
    }

    func setupImageView() {
        imageManager.fetchImageData(url: Constants.randomImageURL) { [weak self] result in
            switch result {
            case .success(let imageData):
                DispatchQueue.main.async {
                    let image = UIImage(data: imageData)
                    self?.onStateChange?(.onImageView(image))
                }
            case .failure(let failure):
                print(failure)
            }
        }?.resume()
    }
}
