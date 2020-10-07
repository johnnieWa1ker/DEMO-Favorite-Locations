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
    
    // MARK: - Initialization
    init(place: PlaceModel?) {
        self.currentPlace = place
    }
}
