//
//  ProductListRouter.swift
//  EVO Test Viper
//
//  Created by Dima Senchik on 8/1/19.
//  Copyright © 2019 Dima Senchik. All rights reserved.
//

import Foundation
import UIKit

final class ProductListRouter: NSObject, ProductListRouterInput {

    // MARK: Public variables
    weak public var viewController: ProductListViewController?
    
    //MARK: - Public methods
    func navigateToDetailScreen(with product: ProductDomainModel) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "productDetailVC") as! ProductDetailViewController
        
        vc.moduleInput.ignitionModuleWith(currentProduct: product)
        
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func openSortView(alertActions: [UIAlertAction]) {
        viewController?.displaySheet("Сортировка", message: "Выберите вариант сортировки", actions: alertActions, cancelActionHandler: nil)
    }
    
    func handleNetworkError(_ error: NetworkError) {
        viewController?.displayError(error.message)
    }
}
