//
//  MediaPickerInteractorInput.swift
//  EVO Test Viper
//
//  Created by Dima Senchik on 8/1/19.
//  Copyright © 2019 Dima Senchik. All rights reserved.
//

import Foundation

protocol ProductListInteractorInput: class {
    func fetchProducts(limit: Int, offset: Int, category: Int, sortType: PossibleSortTypes)
}
