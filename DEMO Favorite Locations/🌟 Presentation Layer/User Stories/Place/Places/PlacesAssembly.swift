//
//  PlacesAssembly.swift
//  DEMO Favorite Locations
//
//  Created by Johnnie Walker on 31.07.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import GKViper

enum PlacesAssembly {
    
    // Create and return controller
    static func create() -> PlacesViewController {
        let vc = PlacesViewController(nibName: PlacesViewController.identifier, bundle: nil)
        return vc
    }
    
    // Create and link modules with controller, return presenter input
    static func configure(with reference: PlacesViewController) -> PlacesPresenterInput {
        let presenter = PlacesPresenter()
        
        let router = PlacesRouter()
        router._mainController = reference
        
        presenter._view = reference
        presenter._router = router
        
        reference._output = presenter
        
        return presenter
    }
}
