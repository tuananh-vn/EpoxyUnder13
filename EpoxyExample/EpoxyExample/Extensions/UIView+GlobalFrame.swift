//
//  UIView+globalFrame.swift
//  VNShop
//
//  Created by linhvt on 11/13/19.
//  Copyright © 2019 Teko. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    var globalPoint: CGPoint? {
        return self.superview?.convert(self.frame.origin, to: nil)
    }
    
    var globalFrame: CGRect? {
        return self.superview?.convert(self.frame, to: nil)
    }
}
