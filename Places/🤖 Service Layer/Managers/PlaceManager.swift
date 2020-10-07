//
//  PlaceManager.swift
//  DEMO Favorite Locations
//
//  Created by Johnnie Walker on 10/7/20.
//  Copyright © 2020 JW. All rights reserved.
//

import Foundation

class PlaceManager {
    
    static let shared = PlaceManager()
    
    private static var places: [PlaceModel] = [PlaceModel(id: 0,
                                           title: "lake Braies",
                                           description: "Cool lake where we were with friends",
                                           type: "some",
                                           rating: 1.0,
                                           cover: AppAssets.place1),
                                PlaceModel(id: 1,
                                           title: "Puerto vallarta",
                                           description: "An unforgettable vacation with my wife",
                                           type: "some",
                                           rating: 2.0,
                                           cover: AppAssets.place2),
                                PlaceModel(id: 2,
                                           title: "Somewhere in the forest",
                                           description: "The colossal hut that my father and I found",
                                           type: "some",
                                           rating: 3.0,
                                           cover: AppAssets.place3),
                                PlaceModel(id: 3,
                                           title: "Death valley",
                                           description: "Road view when I went on a business trip",
                                           type: "some",
                                           rating: 4.0,
                                           cover: AppAssets.place4)]
    
    static func newPlace(title: String, description: String?, type: String?, rating: Double?) -> PlaceModel {
        
        var id: Int {
            var maxId: Int = 0
            for place in places where place.id > maxId {
                maxId = place.id
            }
            return maxId + 1
        }
        
        let place = PlaceModel(id: id,
                               title: title,
                               description: description ?? nil,
                               type: type ?? nil,
                               rating: rating ?? nil,
                               cover: nil)
        
        self.places.append(place)
        
        return place
    }
    
    static func updatePlace(id: Int, title: String, description: String?, type: String?, rating: Double?) {
        for place in places where place.id == id {
            place.title = title
            place.description = description
            place.type = type
            place.rating = rating
        }
    }
}
