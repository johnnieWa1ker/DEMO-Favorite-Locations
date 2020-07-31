//
//  PlaceCellModel.swift
//  DEMO Favorite Locations
//
//  Created by Johnnie Walker on 31.07.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import UIKit
import GKRepresentable

class PlaceCellModel: TableCellModel {
    
    // MARK: - Setup functions
    public override var cellIdentifier: String {
        let id = PlaceCell.identifier
        return id
    }
    
    public override var cellHeight: CGFloat {
        let height = UITableView.automaticDimension
        return height
    }
    
    // MARK: - Props
    
    // MARK: - Initialization
//    init() { }
}
