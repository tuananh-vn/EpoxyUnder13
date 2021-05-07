//
//  VSThemes.swift
//  VNShop
//
//  Created by linhvt on 2/26/20.
//  Copyright © 2020 Teko. All rights reserved.
//

import Foundation

public enum VSThemes: Int {
    case nemo = 0
    case vcb
    
    var plistName: String {
        switch self {
        case .nemo: return "Nemo_Theme"
        case .vcb: return "VCB_Theme"
        }
    }
}

