//
//  CategoryListCategoryListRouter.swift
//  EVO Test Viper
//
//  Created by Senchik Dima on 05/08/2019.
//  Copyright © 2019 Dima Senchik. All rights reserved.
//

import Foundation
import UIKit

class CategoryListRouter: NSObject, CategoryListRouterInput {
    
    // MARK: Public variables
    weak public var viewController: CategoryListViewController?
    
    func navigateToList(with categoryId: Int) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "productListVC") as! ProductListViewController
        vc.moduleInput.ignitionModuleWith(categoryId: categoryId)
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
