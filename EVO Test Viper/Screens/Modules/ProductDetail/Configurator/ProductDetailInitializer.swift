//
//  ProductDetailProductDetailInitializer.swift
//  EVO Test Viper
//
//  Created by Senchik Dima on 01/08/2019.
//  Copyright © 2019 Dima Senchik. All rights reserved.
//

import UIKit

final class ProductDetailInitializer: NSObject {

    ///MARK: - Properties
    @IBOutlet weak var productDetailViewController: ProductDetailViewController!
    
    //MARK: - Life cycle
    override func awakeFromNib() {
        let configurator = ProductDetailConfigurator()
        configurator.configureModuleForViewInput(viewInput: productDetailViewController)
    }

}
