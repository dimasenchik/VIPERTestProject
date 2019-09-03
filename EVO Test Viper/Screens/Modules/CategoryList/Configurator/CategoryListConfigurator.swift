//
//  CategoryListCategoryListConfigurator.swift
//  EVO Test Viper
//
//  Created by Senchik Dima on 05/08/2019.
//  Copyright © 2019 Dima Senchik. All rights reserved.
//

import UIKit

class CategoryListConfigurator {

    //MARK: - Public methods
    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {
        if let viewController = viewInput as? CategoryListViewController {
            configure(viewController: viewController)
        }
    }

    //MARK: - Private methods
    private func configure(viewController: CategoryListViewController) {

        let router = CategoryListRouter()
        router.viewController = viewController

        let presenter = CategoryListPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = CategoryListInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
