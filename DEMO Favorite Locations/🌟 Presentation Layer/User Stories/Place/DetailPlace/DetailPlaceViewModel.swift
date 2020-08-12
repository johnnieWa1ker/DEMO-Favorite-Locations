//
//  DetailPlaceViewModel.swift
//  DEMO Favorite Locations
//
//  Created by Johnnie Walker on 06.08.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import GKViper

class DetailPlaceViewModel: ViperViewModel {
    
    // MARK: - Props
    var currentPlace: PlaceModel?
    
    var newPlaceTitle: String?
    var newPlaceDescription: String?
    var newPlaceType: String?
    var newPlaceCover: UIImage?
    
    var newPlace: PlaceModel? {
        guard let newPlaceTitle = self.newPlaceTitle else { return nil }
        guard let newPlaceDescription = self.newPlaceDescription else { return nil }
        guard let newPlaceType = self.newPlaceType else { return nil }
        
        return PlaceModel(title: newPlaceTitle,
                          description: newPlaceDescription,
                          type: newPlaceType,
                          rating: 0.0,
                          cover: newPlaceCover != nil ? newPlaceCover : UIImage())
    }
    
    // MARK: - Initialization
    init(place: PlaceModel?) {
        self.currentPlace = place
    }
}
