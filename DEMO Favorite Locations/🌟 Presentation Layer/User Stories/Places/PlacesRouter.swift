//
//  PlacesRouter.swift
//  DEMO Favorite Locations
//
//  Created by Johnnie Walker on 31.07.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import GKViper

protocol PlacesRouterInput: ViperRouterInput { }

class PlacesRouter: ViperRouter, PlacesRouterInput {
    
    // MARK: - Props
    fileprivate var mainController: PlacesViewController? {
        guard let mainController = self._mainController as? PlacesViewController else {
            return nil
        }
        return mainController
    }
    
    // MARK: - PlacesRouterInput
    
    // MARK: - Module functions
}
