//
//  VSThemesImage.swift
//  VNShop
//
//  Created by linhvt on 2/28/20.
//  Copyright © 2020 Teko. All rights reserved.
//


enum VSThemesImage {
    
    enum Home {
        static let bgSearch         = ThemeImagePicker(keyPath: VSThemesKeyPath.Home.bgSearch.rawValue)
    }
    
    enum Product {
        static let bgPromotion      = ThemeImagePicker(keyPath: VSThemesKeyPath.KeyPathSection.product(key: .bgPromotion).value)
    }
    
    enum Cart {
        static let imgChecked          = ThemeImagePicker(keyPath: VSThemesKeyPath.KeyPathSection.cart(key: .imgChecked).value)
        static let promotionBackground = ThemeImagePicker(keyPath: VSThemesKeyPath.KeyPathSection.cart(key: .promotionBackground).value)
    }
    
}
