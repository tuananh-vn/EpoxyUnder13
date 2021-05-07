//
//  ViewDecorable.swift
//  VNShop
//
//  Created by linhvt on 2/26/20.
//  Copyright © 2020 Teko. All rights reserved.
//

import Foundation

protocol ColorFillableProtocol {
    func fillColor()
}

protocol LocalizedTextFillableProtocol {
    func fillLocalizedString()
}

protocol ViewDecorable: ColorFillableProtocol, LocalizedTextFillableProtocol {
    
}

extension ViewDecorable {
    func fillColor() {}
    func fillLocalizedString() {}
}
