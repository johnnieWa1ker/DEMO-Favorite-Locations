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
    var placeInput: PlacesPresenterInput?
    
    // MARK: - Initialization
    init(place: PlaceModel, input: ViperPresenterInput) {
        self.viewModel = DetailPlaceViewModel(place: place)
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
        self.placeInput?.updatePlace(self.viewModel.place)
        self.router?.dismiss(animated: true)
    }
    
    func editTitle(_ value: String?) {
        guard let value = value else { return }
        self.viewModel.place.title = value
    }
    
    func editDescription(_ value: String?) {
        guard let value = value else { return }
        self.viewModel.place.description = value
    }
    
    func editType(_ value: String?) {
        guard let value = value else { return }
        self.viewModel.place.type = value
    }
        
    // MARK: - Module functions
}
