//
//  AlphaAddRemoveViewModel.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 5.07.23.
//

import UIKit

protocol AlphaAddRemoveViewModelProtocol {
    var onStateChange: ((AlphaAddRemoveResources.State) -> Void)? { get set }

    func launch()
}

final class AlphaAddRemoveViewModel: AlphaAddRemoveViewModelProtocol {

    typealias Constants = AlphaAddRemoveResources.Constants.Mocks

    private let imageManager: ImageManagerProtocol

    var onStateChange: ((AlphaAddRemoveResources.State) -> Void)?

    // MARK: - Init
    init(imageManager: ImageManagerProtocol) {
        self.imageManager = imageManager
    }

    // MARK: - Public methods
    func launch() {
        setupModels()
    }
}

private extension AlphaAddRemoveViewModel {
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
