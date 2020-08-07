//
//  InitialRouter.swift
//  DEMO Favorite Locations
//
//  Created by Johnnie Walker on 30.07.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import GKViper

protocol InitialRouterInput: ViperRouterInput {
    func presentMainViewController()
}

class InitialRouter: ViperRouter, InitialRouterInput {
    
    // MARK: - Props
    fileprivate var mainController: InitialViewController? {
        guard let mainController = self._mainController as? InitialViewController else {
            return nil
        }
        return mainController
    }
    
    // MARK: - InitialRouterInput
    func presentMainViewController() {
        let placesVC = PlacesAssembly.create()
        _ = PlacesAssembly.configure(with: placesVC)
        let mapVC = MapAssembly.create()
        _ = MapAssembly.configure(with: mapVC)
        
//        let placesNC = BasicNavigationController(rootViewController: placesVC)
        
        let placesBarItem = UITabBarItem(title: "Places", image: UIImage(systemName: "star.fill"), selectedImage: nil)
        let mapBarItem = UITabBarItem(title: "Map", image: UIImage(systemName: "map"), selectedImage: nil)
        
        placesVC.tabBarItem = placesBarItem
        mapVC.tabBarItem = mapBarItem
        
        let tabBarController = UITabBarController()
        tabBarController.setViewControllers([placesVC, mapVC], animated: true)
        
        tabBarController.modalPresentationStyle = .fullScreen

        self.present(tabBarController, animated: false)
    }
    
    // MARK: - Module functions
}
