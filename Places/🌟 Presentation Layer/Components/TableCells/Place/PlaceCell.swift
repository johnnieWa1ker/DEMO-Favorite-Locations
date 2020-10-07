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
import Cosmos

class PlaceCell: TableCell {
    
    // MARK: - Outlets
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var coverImage: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    // MARK: - Props
    let cosmosView = CosmosView()
    
    // MARK: - Setup functions
    override func setupView() {
        self.apply(.clear())
        self.containerView.apply(.roundedAllCorners(AppTheme.lightGray))
        
        self.cosmosView.frame(forAlignmentRect: CGRect(origin: .zero, size: CGSize(width: 250, height: 50)))
        self.containerView.addSubview(cosmosView)
        cosmosView.pin.topLeft(to: descriptionLabel.anchor.bottomLeft).marginVertical(16.0)
        cosmosView.pin.width(self.containerView.frame.width / 4)
        cosmosView.pin.height(16.0)
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
        
        self.cosmosView.rating = place.rating ?? 0.0
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) { }
    
    // MARK: - Actions
}

// MARK: - Module functions
extension PlaceCell { }
