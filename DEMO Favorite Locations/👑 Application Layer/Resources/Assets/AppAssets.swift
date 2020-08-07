//
//  AppAssets.swift
//  DEMO Favorite Locations
//
//  Created by Johnnie Walker on 30.07.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import UIKit

enum AppAssets {
    
    // From this image, the user can find the application on his device
    static var appIcon: UIImage? {
        return UIImage(named: "AppIcon")
    }
    
    // Image for placement on splash screen
    static var appLogo: UIImage? {
        return UIImage(named: "AppLogo")
    }
    
    // MARK: - Backgrounds
    
    //Image for background splash screen
    static var appBackground: UIImage? {
        return UIImage(named: "AppBackground")
    }
    
    // MARK: - Buttons
    
    // MARK: - Icons
    static var iconAddImage: UIImage? {
        let img = UIImage(named: "iconAddImage")
        return img
    }
    
    static var iconBack: UIImage? {
        let img = UIImage(named: "iconBack")
        return img
    }
    
    static var iconDisconnect: UIImage? {
        let img = UIImage(named: "iconDisconnect")
        return img
    }
    
    // MARK: - Logos
    
    // MARK: - Placeholders
    static var addImagePlaceholder: UIImage? {
        let img = UIImage(named: "addImagePlaceholder")
        return img
    }
    
    static var placePlaceholder: UIImage? {
        let img = UIImage(named: "placePlaceholder")
        return img
    }
    
    // Image for temporary placement on those screens that have not yet been developed
    static var wipPlaceholder: UIImage? {
        return UIImage(named: "AppWip")
    }
}
