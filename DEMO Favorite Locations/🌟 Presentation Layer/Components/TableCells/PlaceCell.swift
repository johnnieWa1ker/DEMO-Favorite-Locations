//
//  PlaceCell.swift
//  DEMO Favorite Locations
//
//  Created by Johnnie Walker on 31.07.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import GKViper
import GKRepresentable

class PlaceCell: TableCell {
    
    // MARK: - Outlets
    @IBOutlet private weak var containerView: UIView!
    
    // MARK: - Props
    
    // MARK: - Setup functions
    override func setupView() {
        self.apply(.clear())
        self.containerView.apply(.roundedAllCorners(AppTheme.blue))
    }
    
    override func updateViews() {
        guard let model = self.model as? PlaceCellModel else { return }
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) { }
    
    // MARK: - Actions
}

// MARK: - Module functions
extension PlaceCell { }
