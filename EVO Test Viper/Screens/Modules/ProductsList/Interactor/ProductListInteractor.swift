//
//  MediaPickerInteractor.swift
//  EVO Test Viper
//
//  Created by Dima Senchik on 8/1/19.
//  Copyright © 2019 Dima Senchik. All rights reserved.
//

import Foundation

final class ProductListInteractor {
    weak var output: ProductListInteractorOutput!
}

extension ProductListInteractor: ProductListInteractorInput {
    func fetchProducts(limit: Int, offset: Int, category: Int, sortType: PossibleSortTypes) {
        CatalogService().getDresses(limit: limit, offset: offset, category: category, sortType: sortType, onSuccess: { [weak self] (products) in
            self?.output.prepareDataForDisplay(products)
        }) { [weak self] (error) in
            self?.output.handleError(error)
        }
    }
    
}
