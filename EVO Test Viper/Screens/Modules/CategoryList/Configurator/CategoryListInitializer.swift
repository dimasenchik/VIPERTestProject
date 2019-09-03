//
//  CategoryListCategoryListInitializer.swift
//  EVO Test Viper
//
//  Created by Senchik Dima on 05/08/2019.
//  Copyright © 2019 Dima Senchik. All rights reserved.
//

import UIKit

class CategoryListInitializer: NSObject {

    //MARK: - Properties
    @IBOutlet weak var categorylistViewController: CategoryListViewController!

    //MARK: - Life cycle
    override func awakeFromNib() {
        let configurator = CategoryListConfigurator()
        configurator.configureModuleForViewInput(viewInput: categorylistViewController)
    }

}
