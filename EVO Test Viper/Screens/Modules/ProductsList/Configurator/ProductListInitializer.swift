//
//  ProductListInitializer.swift
//  EVO Test Viper
//
//  Created by Dima Senchik on 7/31/19.
//  Copyright © 2019 Dima Senchik. All rights reserved.
//

import Foundation

final class ProductListInitializer: NSObject {
    
    @IBOutlet weak var productListViewController: ProductListViewController!
    
    override func awakeFromNib() {
        let configurator = ProductListConfigurator()
        configurator.configureModuleForViewInput(viewInput: productListViewController)
    }
}
