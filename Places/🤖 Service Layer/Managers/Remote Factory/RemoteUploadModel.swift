//
//  RemoteUploadModel.swift
//  DEMO Favorite Locations
//
//  Created by Johnnie Walker on 30.07.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import UIKit

public struct RemoteUploadModel {
    var filename: String
    var data: Data
    
    public init(filename: String, data: Data) {
        self.filename = filename
        self.data = data
    }
}
