//
//  DetailPlacePresenter.swift
//  DEMO Favorite Locations
//
//  Created by Johnnie Walker on 06.08.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import GKViper

protocol DetailPlacePresenterInput: ViperPresenterInput { }

class DetailPlacePresenter: ViperPresenter, DetailPlacePresenterInput, DetailPlaceViewOutput {
    
    // MARK: - Props
    fileprivate var view: DetailPlaceViewInput? {
        guard let view = self._view as? DetailPlaceViewInput else {
            return nil
        }
        return view
    }
    
    fileprivate var router: DetailPlaceRouterInput? {
        guard let router = self._router as? DetailPlaceRouterInput else {
            return nil
        }
        return router
    }
    
    var viewModel: DetailPlaceViewModel
    var crudType: CrudType
    var placeInput: PlacesPresenterInput?
    
    // MARK: - Initialization
    init(place: PlaceModel?, crudType: CrudType, input: ViperPresenterInput) {
        self.viewModel = DetailPlaceViewModel(place: place)
        self.crudType = crudType
        self.placeInput = input as? PlacesPresenterInput
    }
    
    // MARK: - DetailPlacePresenterInput
    
    // MARK: - DetailPlaceViewOutput
    override func viewIsReady(_ controller: UIViewController) {
        self.view?.setupInitialState(with: self.viewModel)
    }
    
    func pressedCancelButton() {
        self.router?.dismiss(animated: true)
    }
    
    func pressedSaveButton() {
        
        switch self.crudType {
        case .create:
            guard let place = self.viewModel.newPlace else { return }
            self.placeInput?.updatePlace(place)
        case .update:
            guard let place = self.viewModel.currentPlace else { return }
            self.placeInput?.updatePlace(place)
        }
        self.router?.dismiss(animated: true)
    }
    
    func updateCover(_ cover: UIImage) {
        self.viewModel.newPlaceCover = cover
    }
    
    func pressedAddImageButton() {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let camera = UIAlertAction(title: "Use camera", style: .default) { _ in self.view?.showImagePickerController(.camera) }
        camera.setValue(AppAssets.iconCamera, forKey: "image")
        camera.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
        
        let photoLib = UIAlertAction(title: "Choose from library", style: .default) { _ in self.view?.showImagePickerController(.photoLibrary) }
        photoLib.setValue(AppAssets.iconPhotoAlbum, forKey: "image")
        photoLib.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
        
        let cancel = UIAlertAction(title: AppLocalization.General.cancel.loc, style: .cancel)
        
        alertController.addAction(camera)
        alertController.addAction(photoLib)
        alertController.addAction(cancel)
        
        self.view?.showImageLoadMenu(alertController)
    }
    
    func editTitle(_ value: String?) {
        switch self.crudType {
        case .create:
            self.viewModel.newPlaceTitle = value
        case .update:
            guard let value = value, let place = self.viewModel.currentPlace else { return }
            place.title = value
        }
    }
    
    func editDescription(_ value: String?) {
        switch self.crudType {
        case .create:
            self.viewModel.newPlaceDescription = value
        case .update:
            guard let value = value, let place = self.viewModel.currentPlace else { return }
            place.description = value
        }
    }
    
    func editType(_ value: String?) {
        switch self.crudType {
        case .create:
            self.viewModel.newPlaceType = value
        case .update:
            guard let value = value, let place = self.viewModel.currentPlace else { return }
            place.type = value
        }
    }
    
    // MARK: - Module functions
}
