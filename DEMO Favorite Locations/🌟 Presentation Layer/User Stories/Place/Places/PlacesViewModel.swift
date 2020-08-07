//
//  PlacesViewModel.swift
//  DEMO Favorite Locations
//
//  Created by Johnnie Walker on 31.07.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import GKViper

class PlacesViewModel: ViperViewModel {
    
    // MARK: - Props
    var places: [PlaceModel] {
        var places: [PlaceModel] = []
        for place in 1...5 {
            places.append(PlaceModel(id: place, title: "Place #\(place)", description: "This is place #\(place)", rating: Double.random(in: 0.0...5.0), cover: AppAssets.placePlaceholder))
        }
        return places
    }
    
    // MARK: - Initialization
}
