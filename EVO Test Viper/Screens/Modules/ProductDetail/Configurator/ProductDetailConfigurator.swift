//
//  ProductDetailProductDetailConfigurator.swift
//  EVO Test Viper
//
//  Created by Senchik Dima on 01/08/2019.
//  Copyright © 2019 Dima Senchik. All rights reserved.
//

import UIKit

final class ProductDetailConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? ProductDetailViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: ProductDetailViewController) {
        
        let router = ProductDetailRouter()
        router.viewController = viewController
        
        let presenter = ProductDetailPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = ProductDetailInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
        viewController.moduleInput = presenter
    }

}
