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
    
    // MARK: - Initialization
    override init() {
        self.viewModel = DetailPlaceViewModel()
    }
    
    // MARK: - DetailPlacePresenterInput
    
    // MARK: - DetailPlaceViewOutput
    override func viewIsReady(_ controller: UIViewController) {
        self.view?.setupInitialState(with: self.viewModel)
    }
        
    // MARK: - Module functions
}
