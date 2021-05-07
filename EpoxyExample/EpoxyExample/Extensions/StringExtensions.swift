//
//  StringExtensions.swift
//  TekoMission
//
//  Created by linhvt on 6/29/19.
//  Copyright © 2019 ntq. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    var isNotEmpty: Bool {
        return !isEmpty
    }
    
    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + lowercased().dropFirst()
    }
    
    func localizeWithFormat(args: CVarArg...) -> String {
        return String(format: self, locale: nil, arguments: args)
    }
    
    func localized(bundle: Bundle = VSBundle.shared, tableName: String = "Localizable") -> String {
        return NSLocalizedString(self, tableName: tableName, bundle: bundle, value: self, comment: "")
    }
    
    var httmlAttributedText: NSAttributedString? {
        do {
            let htmlCSSString = self.formattedHtmlContent
            guard let data = htmlCSSString.data(using: String.Encoding.utf8) else {
                return nil
            }
            return try NSAttributedString(data: data,
                                          options: [.documentType: NSAttributedString.DocumentType.html,
                                                    .characterEncoding: String.Encoding.utf8.rawValue],
                                          documentAttributes: nil)
        } catch {
            return nil
        }
    }
    
    var formattedHtmlContent: String {
        let htmlContent = "<style>" +
            "html *" +
            "{" +
                "font-family: 'Roboto', sans-serif !important;" +
                "font-size: 12pt;" +
            "}" +
            "img {" +
                "max-width:\(Constant.Size.screenWidth * 2/3)pt;" +
                "height:auto;" +
            "}" +
            "em" +
            "{" +
                "font-weight: 600 !important;" +
                "font-style: normal !important;" +
            "}" +
            "h2" +
            "{" +
                "font-size: 14pt" +
            "}" +
            "</style>" +
            "<HEAD>" +
                "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0, shrink-to-fit=no\">" +
            "</HEAD>\(self)"
        return htmlContent
    }
    
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)

        return ceil(boundingBox.height)
    }
    
    func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
    
    func heightOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.height
    }
    
    func sizeOfString(usingFont font: UIFont) -> CGSize {
        let fontAttributes = [NSAttributedString.Key.font: font]
        return self.size(withAttributes: fontAttributes)
    }
    
    func toNSRange(from range: Range<Index>) -> NSRange? {
        guard let from = range.lowerBound.samePosition(in: utf16), let to = range.upperBound.samePosition(in: utf16) else {
            return nil
        }
        return NSRange(location: utf16.distance(from: utf16.startIndex, to: from), length: utf16.distance(from: from, to: to))
    }
    
    func lowerAndRemoveMark() -> String {
        return self.lowercased().replacingOccurrences(of: "đ", with: "d").folding(options: .diacriticInsensitive, locale: .current)
    }
    
    func take(to n: Int) -> String {
        guard n >= 0 else {
            assertionFailure("n must be positive!")
            return ""
        }
        let index = self.index(self.startIndex, offsetBy: min(n, self.count))
        return String(self[..<index])
    }
    
    var htmlToAttributed: NSAttributedString? {
        let data = Data(self.utf8)
        return try? NSMutableAttributedString(data: data,
                                      options: [.documentType: NSAttributedString.DocumentType.html,
                                                .characterEncoding: String.Encoding.utf8.rawValue],
                                      documentAttributes: nil).trimmedAttributedString()
    }
    
    func convertHTMLToString() -> String {
        let replaceKeywords = ["</br>", "<br/>", "<br>"]
        var result = self
        replaceKeywords.forEach {
            result = result.replacingOccurrences(of: $0, with: "\n")
        }
        return result
    }
    
    func stringIn(array: [String]) -> Bool {
        return array.firstIndex(of: self) != nil
    }
    
    func stringNotIn(array: [String]) -> Bool {
        return !stringIn(array: array)
    }
    
    var nilIfEmpty: String? {
        if isEmpty { return nil }
        return self
    }
    
    func matches(_ regex: String) -> Bool {
        return self.range(of: regex, options: .regularExpression) != nil
    }

//    var isApplyOnOrderOrPartOrder: Bool {
//        return stringIn(array: [CartApplyType.order.rawValue, CartApplyType.partOrder.rawValue])
//    }
}

extension Optional where Wrapped == String {
    
    var orBlank: String {
        return self ?? ""
    }
    
    func stringIn(array: [String]) -> Bool {
        guard let string = self else { return false }
        return string.stringIn(array: array)
    }
    
    func stringNotIn(array: [String]) -> Bool {
        return !stringIn(array: array)
    }
    
    var nilIfEmpty: String? {
        if case let .some(value) = self, value.isEmpty {
            return nil
        }
        return self
    }

//    var isApplyOnOrderOrPartOrder: Bool {
//        return stringIn(array: [CartApplyType.order.rawValue, CartApplyType.partOrder.rawValue])
//    }
}

extension StringProtocol where Index == String.Index {
    
    var firstUppercased: String { prefix(1).uppercased() + dropFirst() }
    
    var firstCapitalized: String { prefix(1).capitalized + dropFirst() }
    
    func index(of string: Self, options: String.CompareOptions = []) -> Index? {
        return range(of: string, options: options)?.lowerBound
    }
    
    func endIndex(of string: Self, options: String.CompareOptions = []) -> Index? {
        return range(of: string, options: options)?.upperBound
    }
    
    func indexes(of string: Self, options: String.CompareOptions = []) -> [Index] {
        var result: [Index] = []
        var startIndex = self.startIndex
        while startIndex < endIndex,
            let range = self[startIndex...].range(of: string, options: options) {
                result.append(range.lowerBound)
                startIndex = range.lowerBound < range.upperBound ? range.upperBound :
                    index(range.lowerBound, offsetBy: 1, limitedBy: endIndex) ?? endIndex
        }
        return result
    }
    
    func ranges(of string: Self, options: String.CompareOptions = []) -> [Range<Index>] {
        var result: [Range<Index>] = []
        var startIndex = self.startIndex
        while startIndex < endIndex,
            let range = self[startIndex...].range(of: string, options: options) {
                result.append(range)
                startIndex = range.lowerBound < range.upperBound ? range.upperBound :
                    index(range.lowerBound, offsetBy: 1, limitedBy: endIndex) ?? endIndex
        }
        return result
    }
    
    func suffix(after baseString: String) -> String {
        return String(suffix(self.count - baseString.count))
    }
    
}

extension NSRange {
    init?(_ range: Range<String.Index>, in string: String) {
        self.init()
        guard let startIndex = range.lowerBound.samePosition(in: string.utf8),
            let endIndex = range.upperBound.samePosition(in: string.utf8) else {
            return nil
        }
        self.location = string.distance(from: string.startIndex,
                                        to: range.lowerBound)
        self.length = string.distance(from: startIndex, to: endIndex)
    }
}
extension RangeExpression where Bound == String.Index  {
    func nsRange<S: StringProtocol>(in string: S) -> NSRange { .init(self, in: string) }
}
