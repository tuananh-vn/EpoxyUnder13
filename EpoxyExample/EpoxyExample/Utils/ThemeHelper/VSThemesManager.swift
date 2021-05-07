//
//  VSThemesManager.swift
//  VNShop
//
//  Created by linhvt on 2/28/20.
//  Copyright © 2020 Teko. All rights reserved.
//

import UIKit

public class VSThemesManager {
    
    static let shared = VSThemesManager()
    
    private init() { }
    
    var currentTheme: VSThemes = .nemo
    
    func switchTo(_ theme: VSThemes, animated: Bool = true) {
        ThemeManager.animationDuration = animated ? 0.3 : 0.0
        ThemeManager.setTheme(plistName: theme.plistName, path: .appBundle)
        currentTheme = theme
        NotificationCenter.default.post(name: .themeUpdated, object: nil, userInfo: nil)
    }
    
    func switchToDefaultTheme() {
        switchTo(.nemo, animated: false)
    }
    
    func getImage(for keyPath: String) -> UIImage? {
        return ThemeManager.getVSBundleImage(for: keyPath)
    }
    
    func getColor(for keyPath: String) -> UIColor? {
        return ThemeManager.color(for: keyPath)
    }
    
    func getColor(from keyPath: VSThemesKeyPath.KeyPathSection) -> UIColor? {
        return ThemeManager.color(for: keyPath.value)
    }
    
    func getImage(for keyPath: VSThemesKeyPath.KeyPathSection) -> UIImage? {
        return ThemeManager.getVSBundleImage(for: keyPath.value)
    }
    
}

extension VSThemesManager {
    
    func getHomePrimaryColor() -> UIColor? {
        return getColor(for: VSThemesKeyPath.Home.primary.rawValue)
    }
    
    func getHomeBgSearch() -> UIImage? {
        return getImage(for: VSThemesKeyPath.Home.bgSearch.rawValue)
    }
    
    func getGlobalPrimaryColor() -> UIColor? {
         return getColor(for: VSThemesKeyPath.Global.primary.rawValue)
     }
    
}

extension ThemeManager {

    public class func getVSBundleImage(for keyPath: String) -> UIImage? {
        guard let imageName = string(for: keyPath) else { return nil }
        if let filePath = currentThemePath?.URL?.appendingPathComponent(imageName).path {
            guard let image = UIImage(contentsOfFile: filePath) else {
                print("SwiftTheme WARNING: Not found image at file path: \(filePath)")
                return nil
            }
            return image
        } else {
            guard let image = VSBundle.getImage(named: imageName) else {
                print("SwiftTheme WARNING: Not found image name at main bundle: \(imageName)")
                return nil
            }
            return image
        }
    }
}
