//
//  HomeSectionType.swift
//  VNShop
//
//  Created by linhvt on 1/2/20.
//  Copyright © 2020 Teko. All rights reserved.
//


enum HomeSectionType {
    case topBorder
    case bannerSlider
    case minimalProductList
    case productList
    case flashSaleProductList
    case promotedProductList
    case tabbedProductListHeader
    case tabbedProductList
    case menu4
    case menu5
    case mediumMenu
    case categoryList
    case brandBannerList
    case keywordList
    case waitingOrder
    case locationBar
    case empty
    
    var hasHeader: Bool {
        switch self {
        case .topBorder, .bannerSlider, .flashSaleProductList, .promotedProductList, .menu4, .menu5, .tabbedProductList, .waitingOrder, .locationBar, .mediumMenu:
            return false
        default:
            return true
        }
    }
    
    func numberOfItemsInSection(shouldShow: Bool, totalCount: Int) -> Int {
        switch self {
        case .topBorder:
            return shouldShow ? 1 : 0
        case .bannerSlider:
            return shouldShow ? 1 : 0
        case .minimalProductList, .productList, .flashSaleProductList, .promotedProductList, .menu4, .menu5, .mediumMenu, .categoryList, .brandBannerList, .keywordList, .waitingOrder:
            return shouldShow ? (1 + hasHeader.intValue) : 0
        case .tabbedProductListHeader:
            return shouldShow ? 1 : 0
        case .tabbedProductList:
            return shouldShow ? (totalCount + hasHeader.intValue) : 0
        case .locationBar:
            return shouldShow ? 1 : 0
        case .empty:
            return 0
        }
    }
    
}
