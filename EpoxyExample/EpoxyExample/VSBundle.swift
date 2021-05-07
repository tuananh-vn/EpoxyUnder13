//
//  VSBundle.swift
//  VNShop
//
//  Created by batu on 11/15/19.
//  Copyright © 2019 Teko. All rights reserved.
//

import UIKit

class VSBundle {
    static let shared = Bundle(for: VSBundle.self)
    
    static func getImage(named: String) -> UIImage? {
        return UIImage(named: named, in: shared, compatibleWith: nil)
    }
    
    static func loadNibNamed(_ nibName: String, owner: Any?) -> [Any]? {
        return shared.loadNibNamed(nibName, owner: owner, options: nil)
    }
    
}
