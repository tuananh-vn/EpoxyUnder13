//
//  PersonalDealLayoutInfo.swift
//  VNShop
//
//  Created by linhvt on 12/28/19.
//  Copyright © 2019 Teko. All rights reserved.
//

import Foundation
import DeviceKit

protocol CollectionItemSizeProtocol {
    static var width: CGFloat { get }
    static var height: CGFloat { get }
}

extension CollectionItemSizeProtocol {
    static var size: CGSize {
        return CGSize(width: width, height: height)
    }
}

struct HomeHeaderItemSize: CollectionItemSizeProtocol {
    static var width: CGFloat {
        return Constant.Size.screenWidth
    }
    
    static var height: CGFloat {
        return 50
    }
    
}

struct BannerItemSize: CollectionItemSizeProtocol {
    static var width: CGFloat {
        return Constant.Size.screenWidth
    }
    
    static var height: CGFloat {
        return ((Constant.Size.screenWidth - 32)/3) + 16
    }
    
}

struct HomeFirstItemSize: CollectionItemSizeProtocol {
    static var width: CGFloat {
        return Constant.Size.screenWidth
    }
    
    static var height: CGFloat {
        return 24.0
    }
    
}

struct CartItemsItemSize: CollectionItemSizeProtocol {
    static var width: CGFloat {
        return Constant.Size.screenWidth
    }
    
    static var height: CGFloat {
        return 124.0
    }
    
}

struct WaitingOrdersItemSize: CollectionItemSizeProtocol {
    static var width: CGFloat {
        return Constant.Size.screenWidth
    }
    
    static var height: CGFloat {
        return Constant.Size.screenWidth <= Constant.Size.iPhone5Width ? 202 : 170
    }
    
}

struct LocationBarItemSize: CollectionItemSizeProtocol {
    static var width: CGFloat {
        return Constant.Size.screenWidth
    }
    
    static var height: CGFloat {
        return 48
    }
    
}

struct ProductsHistoryItemSize: CollectionItemSizeProtocol {
    static var width: CGFloat {
        return Constant.Size.screenWidth
    }
    
    static var height: CGFloat {
        return 132
    }
    
}

struct CategoriesItemSize: CollectionItemSizeProtocol {
    static let ratio: CGFloat = 80 / 104 /// width / height
    
    static var width: CGFloat {
        return Constant.Size.screenWidth
    }
    
    static var height: CGFloat {
        // 32 is sum of magin left and right
        let itemPerRow: Int = Device.isIpad ? 6 : 4
        let itemWidth = (Constant.Size.screenWidth - 10 * CGFloat(itemPerRow - 1) - 32) / CGFloat(itemPerRow)
        return (itemWidth / ratio) * 2 + 24
    }
    
}

struct CustomCategoriesItemSize: CollectionItemSizeProtocol {
    static let ratio: CGFloat = 2 / 3 /// width / height
    
    static var width: CGFloat {
        return Constant.Size.screenWidth
    }
    
    static var height: CGFloat {
        let itemPerRow: Int = 5
        let itemWidth = (Constant.Size.screenWidth - 8 * CGFloat(itemPerRow - 1) - 16) / CGFloat(itemPerRow)
        return (itemWidth / ratio) * 2 + 16
    }
}

struct MediumMenuItemSize: CollectionItemSizeProtocol {
    static let ratio: CGFloat = 2 / 3 /// width / height
    static let itemPerRow: Int = 5
    
    static var width: CGFloat {
        return Constant.Size.screenWidth
    }
    
    static var height: CGFloat {
        let itemWidth = (Constant.Size.screenWidth - 8 * CGFloat(itemPerRow - 1) - 16) / CGFloat(itemPerRow)
        return (itemWidth / ratio) * 2 + 16
    }
    
    static func heightFor(itemCount: Int) -> CGFloat {
        let itemWidth = (Constant.Size.screenWidth - 8 * CGFloat(itemPerRow - 1) - 16) / CGFloat(itemPerRow)
        let numberOfRow = ceil(Double(itemCount + 1) / Double(itemPerRow))
        let totalSpace = CGFloat(16 * (numberOfRow - 1))
        return (itemWidth / ratio) * CGFloat(numberOfRow) + totalSpace
    }
    
}

struct FlashSaleItemSize: CollectionItemSizeProtocol {
    
    static var width: CGFloat {
        return Constant.Size.screenWidth
    }
    
    static var height: CGFloat {
        return 256
    }
    
}

struct NewSellerItemSize: CollectionItemSizeProtocol {
    
    static var width: CGFloat {
        return Constant.Size.screenWidth
    }
    
    static var height: CGFloat {
        return 272
    }
    
}

struct KeywordsHistoryItemSize: CollectionItemSizeProtocol {
    
    static var width: CGFloat {
        return Constant.Size.screenWidth
    }
    
    static var height: CGFloat {
        return 88
    }
    
}

struct WeeklySuperSaleItemSize: CollectionItemSizeProtocol {
    
    static var width: CGFloat {
        return Constant.Size.screenWidth
    }
    
    static var height: CGFloat {
        return 178.0
    }
    
}

struct MonthlyBestSellingItemSize: CollectionItemSizeProtocol {
    
    static var width: CGFloat {
        return Constant.Size.screenWidth
    }
    
    static var height: CGFloat {
        return 334
    }
    
}

struct TopBrandsItemSize: CollectionItemSizeProtocol {
    
    static var width: CGFloat {
        return Constant.Size.screenWidth
    }
    
    static var height: CGFloat {
        return 136
    }
    
}

struct BestSellingCategoriesItemSize: CollectionItemSizeProtocol {
    
    static let numberOfRows: CGFloat = 2
    
    static var width: CGFloat {
        return Constant.Size.screenWidth
    }
    
    static var height: CGFloat {
        return 358
    }
    
}

struct PersonalDealItemSize: CollectionItemSizeProtocol {
    
    private static let itemsPerRow = Device.isIpad ? 4 : 2
    private static let spacing: CGFloat = 16.0
    private static let padding: CGFloat = 16.0
    private static let ratio: CGFloat = 164 / 354 // width / height
    
    static var width: CGFloat {
        return (Constant.Size.screenWidth - 2 * padding - CGFloat(itemsPerRow - 1) * spacing) / CGFloat(itemsPerRow)
    }
    
    static var height: CGFloat {
        return width / ratio
    }
    
}

protocol HomeCollectionItemSizeProtocol {
    static func getSizeItem(sectionType: HomeSectionType) -> CGSize
}

class HomeCollectionItemSize: HomeCollectionItemSizeProtocol {
    
    static func getSizeItem(sectionType: HomeSectionType) -> CGSize {
        // FIXME: Rename Size classes
        switch sectionType {
        case .topBorder:
            return HomeFirstItemSize.size
        case .bannerSlider:
            return BannerItemSize.size
        case .minimalProductList:
            return CartItemsItemSize.size
        case .productList:
            return MonthlyBestSellingItemSize.size
        case .flashSaleProductList:
            return FlashSaleItemSize.size
        case .promotedProductList:
            return NewSellerItemSize.size
        case .tabbedProductListHeader:
            return HomeHeaderItemSize.size
        case .tabbedProductList:
            return PersonalDealItemSize.size
        case .menu4:
            return CategoriesItemSize.size
        case .menu5:
            return CustomCategoriesItemSize.size
        case .mediumMenu:
            return MediumMenuItemSize.size
        case .categoryList:
            return BestSellingCategoriesItemSize.size
        case .brandBannerList:
            return TopBrandsItemSize.size
        case .keywordList:
            return KeywordsHistoryItemSize.size
        case .waitingOrder:
            return WaitingOrdersItemSize.size
        case .locationBar:
            return LocationBarItemSize.size
        case .empty:
            return .zero
        }
    }
    
}
