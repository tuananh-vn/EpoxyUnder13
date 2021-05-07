//
//  Device.swift
//  VNShop
//
//  Created by linhvt on 9/25/19.
//  Copyright © 2019 Teko. All rights reserved.
//

import Foundation
import UIKit

enum Device {
    static let isIpad = UIDevice.current.userInterfaceIdiom == .pad
    static let isIphone = UIDevice.current.userInterfaceIdiom == .phone
}
