//
//  PlacesPresenter.swift
//  DEMO Favorite Locations
//
//  Created by Johnnie Walker on 31.07.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import GKViper
import GKRepresentable

protocol PlacesPresenterInput: ViperPresenterInput { }

class PlacesPresenter: ViperPresenter, PlacesPresenterInput, PlacesViewOutput {
    
    // MARK: - Props
    fileprivate var view: PlacesViewInput? {
        guard let view = self._view as? PlacesViewInput else {
            return nil
        }
        return view
    }
    
    fileprivate var router: PlacesRouterInput? {
        guard let router = self._router as? PlacesRouterInput else {
            return nil
        }
        return router
    }
    
    var viewModel: PlacesViewModel
    
    // MARK: - Initialization
    override init() {
        self.viewModel = PlacesViewModel()
    }
    
    // MARK: - PlacesPresenterInput
    
    // MARK: - PlacesViewOutput
    override func viewIsReady(_ controller: UIViewController) {
        self.view?.setupInitialState(with: self.viewModel)
        self.makeSections()
    }
    
    func selectedCell(_ place: PlaceModel) {
        self.router?.presentModalDetail(place)
    }
        
    // MARK: - Module functions
    func makeSections() {
        let mainSection = TableSectionModel()
        
        for place in self.viewModel.places {
            let cellModel = PlaceCellModel(place: place)
            mainSection.rows.append(cellModel)
        }
        
        if mainSection.rows.isEmpty {
            self.view?.updateSections([])
        } else {
            self.view?.updateSections([mainSection])
        }
    }
}
