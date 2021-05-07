//
//  FoundationExtensions.swift
//  VNShop
//
//  Created by Dung Nguyen on 10/23/19.
//  Copyright © 2019 Teko. All rights reserved.
//

import Foundation

protocol AnyOptional {
    var isNil: Bool { get }
    var isNotNil: Bool { get }
}

extension Optional: AnyOptional {
    var isNil: Bool { self == nil }
    var isNotNil: Bool { self != nil }
}

extension Bool {
    var intValue: Int {
        return self ? 1 : 0
    }
}

extension Collection {
    var isNotEmpty: Bool {
        return !isEmpty
    }
}

public extension Collection {

    /// Convert self to JSON String.
    /// - Returns: Returns the JSON as String or empty string if error while parsing.
    func json() -> String {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: self, options: [.prettyPrinted])
            guard let jsonString = String(data: jsonData, encoding: String.Encoding.utf8) else {
                print("Can't create string with data.")
                return "{}"
            }
            return jsonString
        } catch let parseError {
            print("json serialization error: \(parseError)")
            return "{}"
        }
    }
}

extension Optional where Wrapped: Collection {
    var isNilOrEmpty: Bool {
        if let self = self {
            return self.isEmpty
        }
        return true
    }
    
    var orEmpty: [Wrapped.Element] {
        switch self {
        case .none:
            return []
        case .some(let collection):
            return Array(collection)
        }
    }

    func map<T>(_ tranform: (Wrapped.Element) throws -> T) rethrows -> [T] {
        return (try self?.map(tranform)) ?? []
    }
    
    func compactMap<ElementOrResult>(_ tranform: (Wrapped.Element) throws -> ElementOrResult?) rethrows -> [ElementOrResult] {
        return (try self?.compactMap(tranform)) ?? []
    }
}
