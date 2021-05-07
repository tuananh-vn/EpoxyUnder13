//
//  VSThemesKeyPath.swift
//  VNShop
//
//  Created by linhvt on 2/28/20.
//  Copyright © 2020 Teko. All rights reserved.
//


enum VSThemesKeyPath {
    enum KeyPathSection {
        case global(key: Global)
        case home(key: Home)
        case product(key: Product)
        case cart(key: Cart)
        
        public var value: String {
            switch self {
            case .global(let key):
                return key.rawValue
            case .home(let key):
                return key.rawValue
            case .product(let key):
                return key.rawValue
            case .cart(let key):
                return key.rawValue
            }
        }
    }
    
    enum Global: String {
        case primary            = "Global.primary"
        case secondary          = "Global.secondary"
        case uiPlaceholder      = "Global.uiPlaceholder"
        case uiBorder           = "Global.uiBorder"
        case uiBg               = "Global.uiBg"
        case statusWarning      = "Global.statusWarning"
        case statusWarningBg    = "Global.statusWarningBg"
        case statusError        = "Global.statusError"
        case statusErrorBg      = "Global.statusErrorBg"
        case statusSuccess      = "Global.statusSuccess"
        case statusSuccessBg    = "Global.statusSuccessBg"
        case statusDisable      = "Global.statusDisable"
        case statusPrimaryBg    = "Global.statusPrimaryBg"
    }
    
    enum Home: String {
        case primary            = "Home.primary"
        case bgSearch           = "Home.bgSearch"
    }
    
    enum Product: String {
        case imgSuccess         = "Product.img_success"
        case bgPromotion        = "Product.bgPromotion"
    }
    
    enum Cart: String {
        case imgChecked          = "Cart.img_checked"
        case promotionBackground = "Cart.promotion_background"
    }
}
