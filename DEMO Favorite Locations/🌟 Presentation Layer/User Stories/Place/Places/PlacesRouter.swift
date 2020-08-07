//
//  PlacesRouter.swift
//  DEMO Favorite Locations
//
//  Created by Johnnie Walker on 31.07.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import GKViper

protocol PlacesRouterInput: ViperRouterInput {
    func presentModalDetail(_ place: PlaceModel)
}

class PlacesRouter: ViperRouter, PlacesRouterInput {
    
    // MARK: - Props
    fileprivate var mainController: PlacesViewController? {
        guard let mainController = self._mainController as? PlacesViewController else {
            return nil
        }
        return mainController
    }
    
    // MARK: - PlacesRouterInput
    func presentModalDetail(_ place: PlaceModel) {
        DispatchQueue.main.async { [weak self] in
            guard let strongSelf = self else { return }
            
            let vc = DetailPlaceAssembly.create()
            _ = DetailPlaceAssembly.configure(with: vc, place: place)
            
            let nc = BasicNavigationController(rootViewController: vc)
            
            strongSelf.present(nc, animated: true)
        }
    }
    
    // MARK: - Module functions
}
