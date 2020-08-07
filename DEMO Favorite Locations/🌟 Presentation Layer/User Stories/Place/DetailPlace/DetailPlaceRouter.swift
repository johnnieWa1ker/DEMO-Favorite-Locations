//
//  DetailPlaceRouter.swift
//  DEMO Favorite Locations
//
//  Created by Johnnie Walker on 06.08.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import GKViper

protocol DetailPlaceRouterInput: ViperRouterInput { }

class DetailPlaceRouter: ViperRouter, DetailPlaceRouterInput {
    
    // MARK: - Props
    fileprivate var mainController: DetailPlaceViewController? {
        guard let mainController = self._mainController as? DetailPlaceViewController else {
            return nil
        }
        return mainController
    }
    
    // MARK: - DetailPlaceRouterInput
    
    // MARK: - Module functions
}
