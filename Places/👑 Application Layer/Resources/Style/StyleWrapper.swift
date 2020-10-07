//
//  StyleWrapper.swift
//  DEMO Favorite Locations
//
//  Created by Johnnie Walker on 30.07.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import Foundation

typealias Style<Element> = (Element) -> Void

enum StyleWrapper<Element> {
    case wrap(style: Style<Element>)
}
