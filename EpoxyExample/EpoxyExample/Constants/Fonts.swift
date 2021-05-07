//
//  Fonts.swift
//  VNShop
//
//  Created by Tung Nguyen on 9/11/19.
//  Copyright © 2019 Dung Nguyen. All rights reserved.
//

import Foundation
import UIKit

enum Fonts {
    
    static func regular(size: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Regular", size: size) ?? UIFont.systemFont(ofSize: size, weight: .regular)
    }
    
    static func medium(size: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Medium", size: size) ?? UIFont.systemFont(ofSize: size, weight: .medium)
    }
    
    static func bold(size: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Bold", size: size) ?? UIFont.systemFont(ofSize: size, weight: .bold)
    }
    
}
