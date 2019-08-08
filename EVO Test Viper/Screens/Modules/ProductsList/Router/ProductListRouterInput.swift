//
//  ProductListRouterInput.swift
//  EVO Test Viper
//
//  Created by Dima Senchik on 8/1/19.
//  Copyright © 2019 Dima Senchik. All rights reserved.
//

import Foundation
import UIKit

protocol ProductListRouterInput: class {
    func navigateToDetailScreen(with product: ProductDomainModel)
    func openSortView(alertActions: [UIAlertAction])
    func handleNetworkError(_ error: NetworkError)
}
