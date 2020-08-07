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
        self.containerView.apply(.roundedAllCorners(AppTheme.mainAccent))
    }
    
    override func updateViews() {
        guard let model = self.model as? PlaceCellModel else { return }
        
        let place = model.place
        
        let starRatingView = StarRatingView(frame: CGRect(origin: .zero, size: CGSize(width: 250, height: 50)), rating: Float(place.rating), color: UIColor.systemOrange, starRounding: .roundToHalfStar)
        self.containerView.addSubview(starRatingView)
        starRatingView.pin.topLeft(to: descriptionLabel.anchor.bottomLeft).marginVertical(4.0)
        starRatingView.pin.width(self.containerView.frame.width / 4)
        starRatingView.pin.height(16.0)
        
        self.coverImage?.image = place.cover
        self.coverImage?.clipsToBounds = true
        self.coverImage?.contentMode = .scaleAspectFill
        self.coverImage.layer.cornerRadius = 10.0
        self.titleLabel.text = place.title
        self.descriptionLabel.text = place.description
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) { }
    
    // MARK: - Actions
}

// MARK: - Module functions
extension PlaceCell { }
