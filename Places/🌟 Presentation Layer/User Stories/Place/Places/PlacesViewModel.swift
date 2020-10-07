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
    var places: [PlaceModel] = [
        PlaceModel(id: 0, title: "lake Braies", description: "Cool lake where we were with friends", type: "some", rating: 1.0, cover: AppAssets.place1),
        PlaceModel(id: 1, title: "Puerto vallarta", description: "An unforgettable vacation with my wife", type: "some", rating: 2.0, cover: AppAssets.place2),
        PlaceModel(id: 2, title: "Somewhere in the forest", description: "The colossal hut that my father and I found", type: "some", rating: 3.0, cover: AppAssets.place3),
        PlaceModel(id: 3, title: "Death valley", description: "Road view when I went on a business trip", type: "some", rating: 4.0, cover: AppAssets.place4)]
    
    // MARK: - Initialization
}
