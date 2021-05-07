//
//  VSThemesColor.swift
//  VNShop
//
//  Created by linhvt on 2/28/20.
//  Copyright © 2020 Teko. All rights reserved.
//

enum VSThemesColor {
    
    enum Global {
        static let primary          = ThemeColorPicker(keyPath: VSThemesKeyPath.Global.primary.rawValue)
        static let secondary        = ThemeColorPicker(keyPath: VSThemesKeyPath.Global.secondary.rawValue)
        static let uiPlaceholder    = ThemeColorPicker(keyPath: VSThemesKeyPath.Global.uiPlaceholder.rawValue)
        static let uiBorder         = ThemeColorPicker(keyPath: VSThemesKeyPath.Global.uiBorder.rawValue)
        static let uiBg             = ThemeColorPicker(keyPath: VSThemesKeyPath.Global.uiBg.rawValue)
        static let statusWarning    = ThemeColorPicker(keyPath: VSThemesKeyPath.Global.statusWarning.rawValue)
        static let statusWarningBg  = ThemeColorPicker(keyPath: VSThemesKeyPath.Global.statusWarningBg.rawValue)
        static let statusError      = ThemeColorPicker(keyPath: VSThemesKeyPath.Global.statusError.rawValue)
        static let statusErrorBg    = ThemeColorPicker(keyPath: VSThemesKeyPath.Global.statusErrorBg.rawValue)
        static let statusSuccess    = ThemeColorPicker(keyPath: VSThemesKeyPath.Global.statusSuccess.rawValue)
        static let statusSuccessBg  = ThemeColorPicker(keyPath: VSThemesKeyPath.Global.statusSuccessBg.rawValue)
        static let statusDisable    = ThemeColorPicker(keyPath: VSThemesKeyPath.Global.statusDisable.rawValue)
        static let statusPrimaryBg  = ThemeColorPicker(keyPath: VSThemesKeyPath.Global.statusPrimaryBg.rawValue)
    }
    
    enum Home {
        static let primary          = ThemeColorPicker(keyPath: VSThemesKeyPath.Home.primary.rawValue)
    }
    
}
