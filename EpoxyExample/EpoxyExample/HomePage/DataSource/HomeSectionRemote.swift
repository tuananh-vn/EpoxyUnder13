//
//  HomeSectionRemote.swift
//  VNShop
//
//  Created by Le Vu Huy on 3/30/20.
//  Copyright © 2020 Teko. All rights reserved.
//

import Foundation

struct HomeSectionRemote {
    let key: String
    let enabled: Bool
    let title: String?
    let showTab: Bool
    
    init(key: String, enabled: Bool, title: String?, showTab: Bool) {
        self.key = key
        self.enabled = enabled
        self.title = title
        self.showTab = showTab
    }
    
    
    init(from dictionary: [String: Any]) {
        self.key = dictionary["key"] as? String ?? ""
        self.enabled = dictionary["enabled"] as? Bool ?? false
        self.title = dictionary["title"] as? String
        self.showTab = dictionary["showTab"] as? Bool ?? false
    }
}
