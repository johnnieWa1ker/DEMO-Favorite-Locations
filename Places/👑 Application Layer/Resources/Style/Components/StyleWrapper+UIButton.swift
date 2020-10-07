//
//  StyleWrapper+UIButton.swift
//  DEMO Favorite Locations
//
//  Created by Johnnie Walker on 30.07.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import Foundation
import UIKit
import PinLayout

extension StyleWrapper where Element: UIButton {
    
    /// Button with rounded corners. The background matches the main color theme of the application.
    static func accent() -> StyleWrapper {
        let wrap = StyleWrapper.wrap { button in
            button.backgroundColor = AppTheme.mainAccent
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
    
    /// Button with transparent background. Image have main accent color and place on center of button.
    static func accentNegativeWithOnlyImage(_ image: UIImage?) -> StyleWrapper {
        let wrap = StyleWrapper.wrap { button in
            button.backgroundColor = .clear
            button.setTitleColor(AppTheme.green, for: .normal)
            button.setTitle("", for: .normal)
            button.layer.cornerRadius = 10.0
            button.layer.masksToBounds = true
            
            let imageView = UIImageView(image: image?.withTintColor(AppTheme.mainAccent))
            imageView.contentMode = .scaleAspectFit
            button.addSubview(imageView)
            imageView.pin.height(button.frame.height / 2.0)
            imageView.pin.center(to: button.anchor.center)
        }
        return wrap
    }
    
    /// Round button with image in the center
    static func circleColoredWithOnlyImage(_ image: UIImage?, imageColor: UIColor) -> StyleWrapper {
        let wrap = StyleWrapper.wrap { button in
            button.backgroundColor = AppTheme.mainAccent
            button.layer.cornerRadius = button.frame.width / 2
            button.layer.masksToBounds = true
            button.setTitle("", for: .normal)
            
            let imageView = UIImageView(image: image?.withTintColor(imageColor))
            imageView.contentMode = .scaleAspectFit
            button.addSubview(imageView)
            imageView.pin.width(button.frame.width / 2.2)
            imageView.pin.height(button.frame.height / 2.2)
            imageView.pin.center(to: button.anchor.center)
        }
        return wrap
    }
}
