//
//  Constant.swift
//  TekoMission
//
//  Created by linhvt on 6/29/19.
//  Copyright © 2019 ntq. All rights reserved.
//

import Foundation
import UIKit

typealias CommonHandler = () -> Void
typealias BoolHandler = (Bool) -> Void
typealias StringHandler = (String?) -> Void

enum Constant {
    enum Size {
        static let screenWidth: CGFloat = UIScreen.main.bounds.width
        static let screenHeight: CGFloat = UIScreen.main.bounds.height
        static let iPhone5Width: CGFloat = 320
    }
    
    enum Pagination {
        static let firstPage = 1
        static let limitPage = 20
        static let searchProductsLimitPage = 20
        static let homeProductsLimitPage = 40
        static let prefetchItems = 6
    }
    
    enum Block {
        static let minItemPerBlock = 4
    }
    
    struct SafeArea {
        static var topPadding: CGFloat {
            let vsWindow = UIApplication.shared.keyWindow
            if #available(iOS 11.0, *) {
                return vsWindow?.safeAreaInsets.top ?? 0
            } else {
                return 0
            }
        }
        
        static var bottomPadding: CGFloat {
            let vsWindow = UIApplication.shared.keyWindow
            if #available(iOS 11.0, *) {
                return vsWindow?.safeAreaInsets.bottom ?? 0
            } else {
                return 0
            }
        }
    }
    
    static let limitImagesInSlide = 5
    static let minProductQuantityInCart = 1
    static let maxProductQuantityInCart = 99
    static let vnShopPhoneNumber = "1800.5888.59"
    static let maxRetryNumber = 1
    static let channelId: Int = 6
    static let retailCustomerID = 29146
    static let asiaCrmId = "39146"
    static let expiredTimeSecDefault: TimeInterval = 3600
    static let bufferTimeToRefreshToken: TimeInterval = 5 * 60
    static let firebaseUser = "vnshop.consumertest@teko.vn"
    static let firebasePwd = "HJLzb7&3/j4>2*\"s"
    
    enum Currency: String {
        case usd = "USD"
        case vnd = "VND"
    }
    
    enum Locale: String {
        case vn
    }
    
    static let qrPaymentTimeout = 300 // 5 mins
    static let cardPaymentTimeout = 300 // 5 mins
    static let successMessage = "Success"
    static let flashSaleReloadPeriod: TimeInterval = 300
    static let intervalsPerDay: TimeInterval = 86400
    static let orderCancelBySystemPeriod: TimeInterval = 1800
    static let orderExpiredTime = 30 // 30 mins
    static let sevenHoursTimeInterval: TimeInterval = 25200
    static let OMSId = "-1"
    static let landingPageBaseUrl = "https://vnshop.vn/landing/"
    
    static let maxHorizontalListItemCount: Int = Int(UInt8.max)
}
