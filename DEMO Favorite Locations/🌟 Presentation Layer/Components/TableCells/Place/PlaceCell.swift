//
//  PlaceCell.swift
//  DEMO Favorite Locations
//
//  Created by Johnnie Walker on 31.07.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import GKViper
import GKRepresentable
import PinLayout

class PlaceCell: TableCell {
    
    // MARK: - Outlets
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var coverImage: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    // MARK: - Props

    // MARK: - Setup functions
    override func setupView() {
        self.apply(.clear())
        self.containerView.apply(.roundedAllCorners(AppTheme.lightGray))
    }
    
    override func updateViews() {
        guard let model = self.model as? PlaceCellModel else { return }
        
        let place = model.place
        
        self.coverImage?.image = place.cover
        self.coverImage?.clipsToBounds = true
        self.coverImage?.contentMode = .scaleAspectFill
        self.coverImage.apply(.roundedLeftCorners())
        
        self.titleLabel.text = place.title
        self.titleLabel.apply(.sfHeadlineRegular16(AppTheme.black, .left))
        
        self.descriptionLabel.text = place.description
        self.descriptionLabel.apply(.sfBodyRegular14(AppTheme.black, .left))
        
        let starRatingView = StarRatingView(frame: CGRect(origin: .zero, size: CGSize(width: 250, height: 50)), rating: Float(place.rating), color: UIColor.systemOrange, starRounding: .roundToHalfStar)
        self.containerView.addSubview(starRatingView)
        starRatingView.pin.topLeft(to: descriptionLabel.anchor.bottomLeft).marginVertical(16.0)
        starRatingView.pin.width(self.containerView.frame.width / 4)
        starRatingView.pin.height(16.0)
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) { }
    
    // MARK: - Actions
}

// MARK: - Module functions
extension PlaceCell { }
