//
//  StyleWrapper+UIButton.swift
//  DEMO Favorite Locations
//
//  Created by Johnnie Walker on 30.07.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import Foundation
import UIKit

extension StyleWrapper where Element: UIButton {
    
    /// Button with rounded corners. The background matches the main color theme of the application.
    static func accent() -> StyleWrapper {
        let wrap = StyleWrapper.wrap { button in
            button.backgroundColor = AppTheme.blue
            button.setTitleColor(AppTheme.white, for: .normal)
            button.titleLabel?.font = SFPRO.medium.font(size: 18.0)
            button.layer.cornerRadius = 10.0
            button.layer.masksToBounds = true
        }
        return wrap
    }
    
    /// Button with transparent background. The main accent color in the signature.
    static func accentNegative() -> StyleWrapper {
        let wrap = StyleWrapper.wrap { button in
            button.backgroundColor = .clear
            button.setTitleColor(AppTheme.green, for: .normal)
            button.titleLabel?.font = SFPRO.medium.font(size: 18.0)
            button.layer.cornerRadius = 10.0
            button.layer.masksToBounds = true
        }
        return wrap
    }
}
