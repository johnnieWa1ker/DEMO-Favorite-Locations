//
//  DetailPlaceAssembly.swift
//  DEMO Favorite Locations
//
//  Created by Johnnie Walker on 06.08.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import GKViper

enum DetailPlaceAssembly {
    
    // Create and return controller
    static func create() -> DetailPlaceViewController {
        let vc = DetailPlaceViewController(nibName: DetailPlaceViewController.identifier, bundle: nil)
        return vc
    }
    
    // Create and link modules with controller, return presenter input
    static func configure(with reference: DetailPlaceViewController, place: PlaceModel, input: ViperPresenterInput) -> DetailPlacePresenterInput {
        let presenter = DetailPlacePresenter(place: place, input: input)
        
        let router = DetailPlaceRouter()
        router._mainController = reference
        
        presenter._view = reference
        presenter._router = router
        
        reference._output = presenter
        
        return presenter
    }
    
}
