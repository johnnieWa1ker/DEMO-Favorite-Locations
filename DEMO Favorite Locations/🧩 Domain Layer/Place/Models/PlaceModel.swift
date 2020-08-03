//
//  PlaceModel.swift
//  DEMO Favorite Locations
//
//  Created by Johnnie Walker on 03.08.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import UIKit

public class PlaceModel {
    
    // MARK: - Props
    var id: Int
    var title: String
    var description: String
    var rating: Double
    var cover: UIImage?
    
    // MARK: - Initialization
    
    init(id: Int,
         title: String,
         description: String,
         rating: Double,
         cover: UIImage?
    ) {
        self.id = id
        self.title = title
        self.description = description
        self.rating = rating
        self.cover = cover
    }
}
