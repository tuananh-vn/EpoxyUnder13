//
//  ShippingSku.swift
//  VNShop
//
//  Created by linhvt on 3/22/20.
//  Copyright © 2020 Teko. All rights reserved.
//

import Foundation

enum ShippingSku: String {
    
    case phongVu        = "1206838"
    case blue           = "VMA00001"
    
    static var list: [ShippingSku] = [.phongVu, .blue]
    static var listCode: [String] = ShippingSku.list.map { $0.rawValue }
}
