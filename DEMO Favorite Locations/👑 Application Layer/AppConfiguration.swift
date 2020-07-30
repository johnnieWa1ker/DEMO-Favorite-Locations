//
//  AppConfiguration.swift
//  DEMO Favorite Locations
//
//  Created by Johnnie Walker on 30.07.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import Foundation

enum AppConfiguration {
    
    static var databaseContainerName: String {
        let name = "DEMO Favorite Locations"
        return name
    }
    
    static var serverUrl: String {
        let url = ""
        if url.isEmpty {
            fatalError("set your server url in AppConfiguration")
        }
        return url
    }
    
    static var serverApi: String {
        let url = AppConfiguration.serverUrl + "/api"
        return url
    }
    
}
