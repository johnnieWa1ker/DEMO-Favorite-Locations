//
//  MapPresenter.swift
//  DEMO Favorite Locations
//
//  Created by Johnnie Walker on 31.07.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import GKViper

protocol MapPresenterInput: ViperPresenterInput { }

class MapPresenter: ViperPresenter, MapPresenterInput, MapViewOutput {
    
    // MARK: - Props
    fileprivate var view: MapViewInput? {
        guard let view = self._view as? MapViewInput else {
            return nil
        }
        return view
    }
    
    fileprivate var router: MapRouterInput? {
        guard let router = self._router as? MapRouterInput else {
            return nil
        }
        return router
    }
    
    var viewModel: MapViewModel
    
    // MARK: - Initialization
    override init() {
        self.viewModel = MapViewModel()
    }
    
    // MARK: - MapPresenterInput
    
    // MARK: - MapViewOutput
    override func viewIsReady(_ controller: UIViewController) {
        self.view?.setupInitialState(with: self.viewModel)
    }
        
    // MARK: - Module functions
}
