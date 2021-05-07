//
//  NSAttributedStringExtensions.swift
//  VNShop
//
//  Created by Tung Nguyen on 9/19/19.
//  Copyright © 2019 Teko. All rights reserved.
//

import Foundation
import UIKit

extension NSMutableAttributedString {
    
    enum AttributeType {
        case regular12
        case regular14
        case medium14
        case regularDark16
        case regularDark13
        case medium12
        case mediumRed14
        case mediumRed16
        case regularLink14
    }
    
    func append(string: String, type: AttributeType = .regular14) {
        switch type {
        case .regular14:
            let string = NSAttributedString(string: string, attributes: [
                .font: Fonts.regular(size: 14)
            ])
            self.append(string)
        case .regularLink14:
            let string = NSAttributedString(string: string, attributes: [
                .font: Fonts.regular(size: 14),
                .foregroundColor: UIColor.link,
                NSAttributedString.Key.underlineStyle : NSUnderlineStyle.single.rawValue
            ])
            self.append(string)
        case .medium14:
            let string = NSAttributedString(string: string, attributes: [
                .font: Fonts.medium(size: 14)
            ])
            self.append(string)
        case .mediumRed14:
            let string = NSAttributedString(string: string, attributes: [
                .font: Fonts.medium(size: 14),
                .foregroundColor: UIColor.primary
            ])
            self.append(string)
        case .regular12:
            let string = NSAttributedString(string: string, attributes: [
                .font: Fonts.regular(size: 12)
            ])
            self.append(string)
        case .medium12:
            let string = NSAttributedString(string: string, attributes: [
                .font: Fonts.medium(size: 12)
            ])
            self.append(string)
        case .regularDark16:
            let string = NSAttributedString(string: string, attributes: [
                .font: Fonts.regular(size: 16),
                .foregroundColor: UIColor.uiDark
            ])
            self.append(string)
        case .regularDark13:
            let string = NSAttributedString(string: string, attributes: [
                .font: Fonts.regular(size: 13),
                .foregroundColor: UIColor.uiDark
            ])
            self.append(string)
        case .mediumRed16:
            let string = NSAttributedString(string: string, attributes: [
                .font: Fonts.medium(size: 16),
                .foregroundColor: UIColor.primary
            ])
            self.append(string)
        }
    }
    
}

extension NSAttributedString {
    
    convenience init(htmlString html: String) throws {
        try self.init(data: Data(html.utf8), options: [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ], documentAttributes: nil)
    }
    
}

extension NSAttributedString {
    convenience init(format: NSAttributedString, args: NSAttributedString...) {
        let mutableNSAttributedString = NSMutableAttributedString(attributedString: format)
        
        args.forEach { (attributedString) in
            let range = NSString(string: mutableNSAttributedString.string).range(of: "%@")
            mutableNSAttributedString.replaceCharacters(in: range, with: attributedString)
        }
        self.init(attributedString: mutableNSAttributedString)
    }
    
    convenience init(format: NSAttributedString, attributedStrings: [NSAttributedString]) {
        let mutableNSAttributedString = NSMutableAttributedString(attributedString: format)
        
        attributedStrings.forEach { (attributedString) in
            let range = NSString(string: mutableNSAttributedString.string).range(of: "%@")
            mutableNSAttributedString.replaceCharacters(in: range, with: attributedString)
        }
        self.init(attributedString: mutableNSAttributedString)
    }
    
    func toNSMutableAttributedString() -> NSMutableAttributedString {
        guard let this = self as? NSMutableAttributedString else {
            let string = NSMutableAttributedString()
            string.append(self)
            return string
        }
        return this
    }
    
    func toHTMLString() -> String? {
        do {
            let htmlData = try self.data(from: NSRange(location: 0, length: self.length), documentAttributes:[.documentType: NSAttributedString.DocumentType.html])
            return String.init(data: htmlData, encoding: String.Encoding.utf8)
        } catch {
            assertionFailure("Can't convert to HTML String")
            return nil
        }
    }
    
}

extension NSMutableAttributedString {
    
    func setLineSpacing(spacing: CGFloat) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = spacing
        self.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range: NSMakeRange(0, self.length))
    }
    
    func appended(_ attrString: NSAttributedString) -> NSMutableAttributedString {
        self.append(attrString)
        return self
    }
    
    func appended(_ string: String) -> NSMutableAttributedString {
        self.append(NSAttributedString(string: string))
        return self
    }
    
    func setStyleForText(_ textToFind: String, with attributes: [NSAttributedString.Key: Any]) {
        let range = self.mutableString.range(of: textToFind, options: .caseInsensitive)
        if range.location != NSNotFound {
            attributes.forEach { (key, value) in
                addAttribute(key, value: value, range: range)
            }
        }
    }
    
    func trimmedAttributedString() -> NSAttributedString {
        let invertedSet = CharacterSet.whitespacesAndNewlines.inverted
        let startRange = string.rangeOfCharacter(from: invertedSet)
        let endRange = string.rangeOfCharacter(from: invertedSet, options: .backwards)
        guard let startLocation = startRange?.upperBound, let endLocation = endRange?.lowerBound else {
            return NSAttributedString(string: string)
        }
        let location = string.distance(from: string.startIndex, to: startLocation) - 1
        let length = string.distance(from: startLocation, to: endLocation) + 2
        let range = NSRange(location: location, length: length)
        return attributedSubstring(from: range)
    }
    
    func height(containerWidth: CGFloat) -> CGFloat {
        
        let rect = self.boundingRect(with: CGSize.init(width: containerWidth, height: CGFloat.greatestFiniteMagnitude),
                                     options: [.usesLineFragmentOrigin, .usesFontLeading],
                                     context: nil)
        return ceil(rect.size.height)
    }
    
    func width(containerHeight: CGFloat) -> CGFloat {
        
        let rect = self.boundingRect(with: CGSize.init(width: CGFloat.greatestFiniteMagnitude, height: containerHeight),
                                     options: [.usesLineFragmentOrigin, .usesFontLeading],
                                     context: nil)
        return ceil(rect.size.width)
    }
    
    public func setAsLink(textToFind: String, linkURL:String) -> Bool {
        let foundRange = self.mutableString.range(of: textToFind)
        guard foundRange.location != NSNotFound else {
            return false
        }
        self.addAttribute(.link, value: linkURL, range: foundRange)
        return true
    }
}
