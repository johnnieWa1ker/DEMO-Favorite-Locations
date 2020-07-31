//
//  MapRouter.swift
//  DEMO Favorite Locations
//
//  Created by Johnnie Walker on 31.07.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import GKViper

protocol MapRouterInput: ViperRouterInput { }

class MapRouter: ViperRouter, MapRouterInput {
    
    // MARK: - Props
    fileprivate var mainController: MapViewController? {
        guard let mainController = self._mainController as? MapViewController else {
            return nil
        }
        return mainController
    }
    
    // MARK: - MapRouterInput
    
    // MARK: - Module functions
}
