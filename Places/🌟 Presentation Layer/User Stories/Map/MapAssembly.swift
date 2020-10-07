//
//  MapAssembly.swift
//  DEMO Favorite Locations
//
//  Created by Johnnie Walker on 31.07.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import GKViper

enum MapAssembly {
    
    // Create and return controller
    static func create() -> MapViewController {
        let vc = MapViewController(nibName: MapViewController.identifier, bundle: nil)
        return vc
    }
    
    // Create and link modules with controller, return presenter input
    static func configure(with reference: MapViewController) -> MapPresenterInput {
        let presenter = MapPresenter()
        
        let router = MapRouter()
        router._mainController = reference
        
        presenter._view = reference
        presenter._router = router
        
        reference._output = presenter
        
        return presenter
    }
    
}
