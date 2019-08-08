//
//  ProductDetailProductDetailRouterInput.swift
//  EVO Test Viper
//
//  Created by Senchik Dima on 01/08/2019.
//  Copyright © 2019 Dima Senchik. All rights reserved.
//

import Foundation

protocol ProductDetailRouterInput {
    func showOnBuyAlert(with product: ProductDomainModel)
    func showFavouriteAlert(with product: ProductDomainModel)
}
