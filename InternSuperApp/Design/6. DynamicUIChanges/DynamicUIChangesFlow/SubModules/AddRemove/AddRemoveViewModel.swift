//
//  AddRemoveViewModel.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 2.07.23.
//

import UIKit

protocol AddRemoveViewModelProtocol {
    var onStateChange: ((AddRemoveResources.State) -> Void)? { get set }

    func launch()
    func didTapAddButton()
    func didTapRemoveButton()
}

final class AddRemoveViewModel: AddRemoveViewModelProtocol {

    typealias Constants = AddRemoveResources.Constants.Mocks

    private let imageManager: ImageManagerProtocol

    var onStateChange: ((AddRemoveResources.State) -> Void)?

    // MARK: - Init
    init(imageManager: ImageManagerProtocol) {
        self.imageManager = imageManager
    }

    // MARK: - Public methods
    func launch() {
        setupModels()
    }

    func didTapAddButton() {
        guard let imageData = self.fetchImageData() else { return }
        let image = UIImage(data: imageData)

        onStateChange?(.onAddImage(image))
    }

    func didTapRemoveButton() {
        onStateChange?(.onRemoveImage)
    }
}

private extension AddRemoveViewModel {
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

    func fetchImageData() -> Data? {
        var imageData: Data?

        imageManager.fetchImageData(url: Constants.randomImageURL, completion: { result in
            switch result {
            case .success(let success):
                imageData = success
            case .failure(let failure):
                print(failure)
            }
        })?.resume()

        return imageData
    }
}

