//
//  CardCollectionViewCellViewModel.swift
//  InternSuperApp
//
//  Created by Vlad Katsubo on 7.08.23.
//

import Foundation

protocol CardCollectionViewCellViewModelProtocol {
    var onUserImageData: ((Data) -> Void)? { get set }
    var onUserInfo: ((CardCollectionViewCell.Model) -> Void)? { get set }

    func launch()
    func cancelImageDownload()
}

final class CardCollectionViewCellViewModel: CardCollectionViewCellViewModelProtocol {

    private var imageManager: ImageManagerProtocol?
    private var model: CardCollectionViewCell.Model?

    var onUserImageData: ((Data) -> Void)?
    var onUserInfo: ((CardCollectionViewCell.Model) -> Void)?

    private var dataTask: URLSessionDataTask?

    // MARK: - Configure
    init(model: CardCollectionViewCell.Model, imageManager: ImageManagerProtocol) {
        self.model = model
        self.imageManager = imageManager
    }

    // MARK: - Public methods
    func launch() {
        guard let model = model,
              let url = model.avatarImageURL else {
            return
        }

        self.dataTask = fetchImage(for: url)
        self.setupUserInfo(with: model)
    }

    func cancelImageDownload() {
        if let task = dataTask {
            imageManager?.cancelDataTask(task)
        }
    }
}

private extension CardCollectionViewCellViewModel {
    // MARK: - Private methods
    func fetchImage(for url: URL?) -> URLSessionDataTask? {
        guard let url = url else { return nil }

        let dataTask = imageManager?.fetchImageData(url: url, completion: { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.onUserImageData?(data)
                }
            case .failure(let failure):
                if (failure as NSError).code == NSURLErrorCancelled {
                    // MARK: Prevented the wrong image from being shown by cancelling the URLSessionDataTask
                } else {
                    print("Image fetching failure", failure)
                }
            }
        })
        return dataTask
    }

    func setupUserInfo(with model: CardCollectionViewCell.Model) {
        onUserInfo?(model)
    }
}

