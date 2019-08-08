//
//  ProductListConfigurator.swift
//  EVO Test Viper
//
//  Created by Dima Senchik on 7/31/19.
//  Copyright © 2019 Dima Senchik. All rights reserved.
//

import Foundation

final class ProductListConfigurator {
    
    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {
        
        if let viewController = viewInput as? ProductListViewController {
            configure(viewController: viewController)
        }
    }
    
    private func configure(viewController: ProductListViewController) {
        
        let router = ProductListRouter()
        router.viewController = viewController
        
        let presenter = ProductListPresenter()
        presenter.view = viewController
        presenter.router = router
        
        let interactor = ProductListInteractor()
        interactor.output = presenter
        
        presenter.interactor = interactor
        viewController.output = presenter
        viewController.moduleInput = presenter
    }
}
