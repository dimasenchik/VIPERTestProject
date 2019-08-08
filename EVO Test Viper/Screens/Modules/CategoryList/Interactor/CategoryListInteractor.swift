//
//  CategoryListCategoryListInteractor.swift
//  EVO Test Viper
//
//  Created by Senchik Dima on 05/08/2019.
//  Copyright © 2019 Dima Senchik. All rights reserved.
//

final class CategoryListInteractor {
    weak var output: CategoryListInteractorOutput!
}

// MARK: - CategoryListInteractorInput
extension CategoryListInteractor: CategoryListInteractorInput {
    func fetchCategories() {
        let categories = [CategoryDataDomainModel.init(id: 35402, name: "Женские платья", imageURL: "https://images.ua.prom.st/1820024096_w640_h640_letnee-elegantnoe-plate.jpg"),
                          CategoryDataDomainModel.init(id: 18, name: "Аксессуары", imageURL: "https://images.ua.prom.st/1539848139_w640_h640_nozh-kreditka-vizitka.jpg"),
                          CategoryDataDomainModel.init(id: 20, name: "Спорт", imageURL: "https://images.ua.prom.st/1706339945_w640_h640_triko-bortsovskoe-wr.jpg"),
                          CategoryDataDomainModel.init(id: 21, name: "Уборка", imageURL: "https://images.ua.prom.st/1904386830_w640_h640_silikonovyj-kovrik-dlya.jpg")]
        
        output.prepareDataForDisplay(categories)
    }
}

