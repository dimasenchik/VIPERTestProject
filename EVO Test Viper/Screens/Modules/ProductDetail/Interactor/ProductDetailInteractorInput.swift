//
//  ProductDetailProductDetailInteractorInput.swift
//  EVO Test Viper
//
//  Created by Senchik Dima on 01/08/2019.
//  Copyright © 2019 Dima Senchik. All rights reserved.
//

import Foundation

protocol ProductDetailInteractorInput: class {
    func addToCart(product: ProductDomainModel)
    func addToFavourite(product: ProductDomainModel)
}

