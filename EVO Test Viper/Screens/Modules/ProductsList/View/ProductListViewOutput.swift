//
//  ProductListViewOutput.swift
//  EVO Test Viper
//
//  Created by Dima Senchik on 7/31/19.
//  Copyright © 2019 Dima Senchik. All rights reserved.
//

import Foundation

protocol ProductListViewOutput: class {
    func viewIsReady()
    func viewDidDissapear()
    func tappedSort()
    func navigateToDetail(with productIndex: Int)
    func reSortProducts(_ sortType: PossibleSortTypes)
    func addingItems()
}
