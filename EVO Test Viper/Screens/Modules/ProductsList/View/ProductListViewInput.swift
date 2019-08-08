//
//  ProductListViewInput.swift
//  EVO Test Viper
//
//  Created by Dima Senchik on 7/31/19.
//  Copyright © 2019 Dima Senchik. All rights reserved.
//

import Foundation

protocol ProductListViewInput: class {
    func displayProducts(_ products: [ProductDomainModel], currentSortType: PossibleSortTypes)
    func addProducts(_ products: [ProductDomainModel])
}
