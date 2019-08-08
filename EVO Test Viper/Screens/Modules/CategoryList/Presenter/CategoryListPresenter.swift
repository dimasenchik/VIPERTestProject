//
//  CategoryListCategoryListPresenter.swift
//  EVO Test Viper
//
//  Created by Senchik Dima on 05/08/2019.
//  Copyright © 2019 Dima Senchik. All rights reserved.
//

final class CategoryListPresenter {
    // MARK: - Properties
    weak var view: CategoryListViewInput!
    var interactor: CategoryListInteractorInput!
    var router: CategoryListRouterInput!
}

// MARK: - CategoryListModuleInput
extension CategoryListPresenter: CategoryListModuleInput {}

// MARK: - CategoryListViewOutput
extension CategoryListPresenter: CategoryListViewOutput {
    func viewIsReady() {
        interactor.fetchCategories()
    }
    
    func navigateToList(categoryId: Int) {
        router.navigateToList(with: categoryId)
    }
}

// MARK: - CategoryListInteractorOutput
extension CategoryListPresenter: CategoryListInteractorOutput {
    func prepareDataForDisplay(_ categoryData: [CategoryDataDomainModel]) {
        view.displayCategories(categoryData)
    }
}
