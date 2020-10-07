//
//  StarRatingStackView.swift
//
//  Created by Guido on 7/1/20.
//  Copyright © applified.life - All rights reserved.
//

// swiftlint:disable all
import UIKit

class StarRatingStackView: UIStackView {
    
    @IBOutlet public weak var star1ImageView: UIImageView!
    @IBOutlet public weak var star2ImageView: UIImageView!
    @IBOutlet public weak var star3ImageView: UIImageView!
    @IBOutlet public weak var star4ImageView: UIImageView!
    @IBOutlet public weak var star5ImageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
