//
//  NotificationName.swift
//  VNShop
//
//  Created by linhvt on 10/2/19.
//  Copyright © 2019 Teko. All rights reserved.
//

import Foundation

extension Notification.Name {
    static let openHomePage             = Notification.Name(rawValue: "openHomePage")
    static let updateBadgeValue         = Notification.Name(rawValue: "updateBadgeValue")
    static let updatePopularKeywords    = Notification.Name(rawValue: "updatePopularKeywords")
    static let startTimer               = Notification.Name(rawValue: "startTimer")
    static let stopTimer                = Notification.Name(rawValue: "stopTimer")
    static let bannerStartTimer         = Notification.Name(rawValue: "bannerStartTimer")
    static let bannerStopTimer          = Notification.Name(rawValue: "bannerStopTimer")
    static let qrPayment                = Notification.Name(rawValue: "qr_payment")
    static let cartUpdated              = Notification.Name(rawValue: "cart_updated")
    static let updateUnreadNotificationCount = Notification.Name(rawValue: "updateUnreadNotificationCount")
    static let requestReloadWaitingOrder = Notification.Name(rawValue: "requestReloadWaitingOrder")
    static let didOrderCanceled         = Notification.Name(rawValue: "didOrderCanceled")
    static let enterHome                = Notification.Name(rawValue: "enterHome")
    static let logOut                   = Notification.Name(rawValue: "logOut")
    static let themeUpdated             = Notification.Name(rawValue: "themeUpdated")
    static let doubleTapTab             = Notification.Name(rawValue: "doubleTapTab")
    static let needToRefreshNotification = Notification.Name(rawValue: "needToRefreshNotification")
    static let finishRegisterLoyaltyMembership = Notification.Name(rawValue: "finishRegisterLoyaltyMembership")
    static let updatedUserInfo          = Notification.Name(rawValue: "updatedUserInfoSuccess")
    static let refreshHomeScreen        = Notification.Name(rawValue: "refreshHomeScreen")
}
