//
//  UIView+DropShadow.swift
//  VNShop
//
//  Created by linhvt on 10/14/19.
//  Copyright © 2019 Teko. All rights reserved.
//

import UIKit

extension UIView {
    func dropShadow(withCornerRadius cornerRadius: CGFloat = 0.0,
                   color: UIColor = .black,
                   alpha: Float = 0.05,
                   x: CGFloat = 0.0,
                   y: CGFloat = 0.0,
                   blur: CGFloat = 0.0,
                   spread: CGFloat = 0.0) {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = alpha
        self.layer.shadowOffset = CGSize(width: x, height: y)
        self.layer.shadowRadius = blur / 2.0
        if (spread == 0) {
            self.layer.shadowPath = nil
        } else {
            let dx = -spread
            let rect = self.layer.bounds.insetBy(dx: dx, dy: dx)
            self.layer.shadowPath = UIBezierPath(rect: rect).cgPath
        }
        self.layer.masksToBounds = false;
        self.layer.cornerRadius = cornerRadius;
    }
    
    func dropShadowForHeaderView() {
        dropShadow(withCornerRadius: 0.0, color: .black, alpha: 0.08, x: 0.0, y: 2.0, blur: 8.0)
    }
    
    func dropShadowForFooterView() {
        dropShadow(withCornerRadius: 0.0, color: .black, alpha: 0.08, x: 0.0, y: -2.0, blur: 8.0)
    }
}
