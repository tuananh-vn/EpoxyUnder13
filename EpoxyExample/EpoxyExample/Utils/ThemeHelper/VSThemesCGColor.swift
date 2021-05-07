//
//  VSThemesCGColor.swift
//  VNShop
//
//  Created by Le Vu Huy on 3/2/20.
//  Copyright © 2020 Teko. All rights reserved.
//

import Foundation

enum VSThemesCGColor {
    
    enum Global {
        static let primary          = ThemeCGColorPicker(keyPath: VSThemesKeyPath.Global.primary.rawValue)
        static let secondary        = ThemeCGColorPicker(keyPath: VSThemesKeyPath.Global.secondary.rawValue)
        static let uiPlaceholder    = ThemeCGColorPicker(keyPath: VSThemesKeyPath.Global.uiPlaceholder.rawValue)
        static let uiBorder         = ThemeCGColorPicker(keyPath: VSThemesKeyPath.Global.uiBorder.rawValue)
        static let uiBg             = ThemeCGColorPicker(keyPath: VSThemesKeyPath.Global.uiBg.rawValue)
        static let statusWarning    = ThemeCGColorPicker(keyPath: VSThemesKeyPath.Global.statusWarning.rawValue)
        static let statusWarningBg  = ThemeCGColorPicker(keyPath: VSThemesKeyPath.Global.statusWarningBg.rawValue)
        static let statusError      = ThemeCGColorPicker(keyPath: VSThemesKeyPath.Global.statusError.rawValue)
        static let statusErrorBg    = ThemeCGColorPicker(keyPath: VSThemesKeyPath.Global.statusErrorBg.rawValue)
        static let statusSuccess    = ThemeCGColorPicker(keyPath: VSThemesKeyPath.Global.statusSuccess.rawValue)
        static let statusSuccessBg  = ThemeCGColorPicker(keyPath: VSThemesKeyPath.Global.statusSuccessBg.rawValue)
        static let statusDisable    = ThemeCGColorPicker(keyPath: VSThemesKeyPath.Global.statusDisable.rawValue)
        static let statusPrimaryBg    = ThemeCGColorPicker(keyPath: VSThemesKeyPath.Global.statusPrimaryBg.rawValue)
    }
    
    enum Home {
        static let primary          = ThemeCGColorPicker(keyPath: VSThemesKeyPath.Home.primary.rawValue)
    }
    
}
