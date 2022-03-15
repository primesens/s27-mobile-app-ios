//
//  Extension.swift
//  Social27
//
//  Created by Gautham Sritharan on 2021-12-06.
//  Copyright © 2021 PrimeSens LLC. All rights reserved.
//

import Foundation
import UIKit

var bindObjKey = "ObserverBindKey"
var uuidKey = "uuid"
let imageCache = NSCache<NSString, UIImage>()

// MARK: - NSObject

public extension NSObject {
    
    var bindObj: [UUID:[String]] {
        get {
            
            if let o = objc_getAssociatedObject(self, &bindObjKey) as? [UUID:[String]] {
                return o
            } else {
                self.bindObj = [UUID:[String]]()
                return self.bindObj
            }
            
        } set {
            objc_setAssociatedObject(self, &bindObjKey, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    func safeAdd(observer: NSObject, forKeyPath: String, options:
        NSKeyValueObservingOptions, context: UnsafeMutableRawPointer?) {
        if bindObj[observer.uuid] == nil {
            bindObj[observer.uuid] = [String]()
        }
        if let b = bindObj[observer.uuid], !b.contains(forKeyPath) {
            bindObj[observer.uuid]?.append(forKeyPath)
            self.addObserver(observer, forKeyPath: forKeyPath, options: options, context: context)
        }
    }
    
    func safeRemove(observer: NSObject, forKeyPath: String) {
        if let b = bindObj[observer.uuid], let keyIdx = b.firstIndex(of: forKeyPath) {
            bindObj[observer.uuid]?.remove(at: keyIdx)
            self.removeObserver(observer, forKeyPath: forKeyPath)
        }
    }
    
    var uuid: UUID {
        get {
            if let o = objc_getAssociatedObject(self, &uuidKey) as? UUID {
                return o
            } else {
                objc_setAssociatedObject(self, &uuidKey, UUID(), .OBJC_ASSOCIATION_RETAIN)
                return self.uuid
            }
        }
    }
}

// MARK: - UIImageView

extension UIImageView {
    
    private func startDownload(url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        
        DispatchCreate.instance.dispatchGroup.enter()

        URLSession.shared.dataTask(with: url) { data, response, error in
        
           guard let httpURLResponse = response as? HTTPURLResponse,
            let data = data, error == nil
            else { return }
            
            guard let image = UIImage(data: data) else {
                print("no image found")
                return
            }
            let string = httpURLResponse.url?.scheme ?? ""
            imageCache.setObject(image, forKey: string as NSString)
            DispatchQueue.main.async() {
                DispatchCreate.instance.dispatchGroup.leave()
                self.image = image
            }
        }.resume()
    }
    
    func dowloadFromServer(link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        // check cached image
        if let cachedImage = imageCache.object(forKey: link as NSString)  {
            self.image = cachedImage
            return
        }

        guard let url = URL(string: link) else { return }
        objc_setAssociatedObject(self, &bindObjKey, url, .OBJC_ASSOCIATION_RETAIN)
        startDownload(url: url, contentMode: mode)
    }
    
}

struct DispatchCreate {
    static let instance = DispatchCreate()
    let dispatchGroup = DispatchGroup()
}

// MARK: - UITextField

extension UITextField {
    func textFieldBoarderOne() {
        self.layer.borderWidth = 0.5
        self.layer.cornerRadius = 7
        self.layer.borderColor = #colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)
    }
}

// MARK: - String
extension String {
    
    func trim() -> String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    func removingAllWhitespaces() -> String {
        return removingCharacters(from: .whitespaces)
    }
    
    func removingCharacters(from set: CharacterSet) -> String {
        var newString = self
        newString.removeAll { char -> Bool in
            guard let scalar = char.unicodeScalars.first else { return false }
            return set.contains(scalar)
        }
        return newString
    }
    
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
    
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    
    func htmlAttributedString(family: String?, size: CGFloat, hexString: String) -> NSAttributedString? {
        do {
            let htmlCSSString = "<style>" +
                "html *" +
                "{" +
                "font-size: \(size)pt !important;" +
                "color: #\(hexString) !important;" +
                "font-family: \(family ?? "Helvetica"), Helvetica !important;" +
            "}</style> \(self)"
            
            guard let data = htmlCSSString.data(using: String.Encoding.utf8) else {
                return nil
            }
            
            return try NSAttributedString(data: data,
                                          options: [.documentType: NSAttributedString.DocumentType.html,
                                                    .characterEncoding: String.Encoding.utf8.rawValue],
                                          documentAttributes: nil)
        } catch {
            print("error: ", error)
            return nil
        }
    }
    
    //get Date string and split it
    func getDateString() -> String {
        let dateStr = self
        let dateValue = dateStr.components(separatedBy: " ")
        let date = dateValue[0]
        return date
    }
    
    func getYearDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.date(from: self)
    }
    
    func getYearDateSlash() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.date(from: self)
    }
    
    func getStandardDate() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatter.date(from: self) ?? Date()
    }
    
    func timeAgoDisplay() -> String {
        
        let secondsAgo = Int(self.getStandardDate().timeIntervalSince(Date()))
        
        let minute = 60
        let hour = 60 * minute
        let day = 24 * hour
        let week = 7 * day
        
        if secondsAgo < 10 {
            return "Now"
        } else if secondsAgo < minute {
            return "\(secondsAgo) sec left"
        } else if secondsAgo < hour {
            return "\(secondsAgo / minute) min left"
        } else if secondsAgo < day {
            return "\(secondsAgo / hour) hrs left"
        } else if secondsAgo < week {
            let dayValue = secondsAgo / day
            if dayValue == 1 {
                return "\(secondsAgo / day) day left"
            } else {
                return "\(secondsAgo / day) days left"
            }
        }
        
        let weekValue = secondsAgo / week
        if weekValue == 1 {
            return "\(secondsAgo / week) week left"
        } else {
            return "\(secondsAgo / week) weeks left"
        }
    }
    
    func deletingPrefix(_ prefix: String) -> String {
        guard self.hasPrefix(prefix) else { return self }
        return String(self.dropFirst(prefix.count))
    }
    
    var numberOfWords: Int {
        let inputRange = CFRangeMake(0, utf16.count)
        let flag = UInt(kCFStringTokenizerUnitWord)
        let locale = CFLocaleCopyCurrent()
        let tokenizer = CFStringTokenizerCreate(kCFAllocatorDefault, self as CFString, inputRange, flag, locale)
        var tokenType = CFStringTokenizerAdvanceToNextToken(tokenizer)
        var count = 0

        while tokenType != [] {
            count += 1
            tokenType = CFStringTokenizerAdvanceToNextToken(tokenizer)
        }
        return count
    }
}


// MARK: - UIView
extension UIView {
    
    func addLayerEffects(with borderColor: UIColor? = nil, borderWidth: CGFloat = 0.0, cornerRadius: CGFloat = 0.0) {
        self.layer.borderColor = borderColor?.cgColor
        self.layer.borderWidth = borderWidth
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    func circularView() {
        self.layer.cornerRadius = self.layer.bounds.width / 2
        self.clipsToBounds = true
    }
    
    func customTextField() {
        self.layer.borderColor = #colorLiteral(red: 0.7214964032, green: 0.721619308, blue: 0.72148031, alpha: 1)
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 7
    }
    
    func customButton() {
        self.layer.cornerRadius = 7
        self.layer.borderWidth = 1
        self.layer.borderColor = #colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 0.8)
    }
    
    func customView() {
        self.layer.cornerRadius = 7
        self.layer.borderWidth = 1
        self.layer.borderColor = #colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 0.8)
    }
    
    func customButtonTwo() {
        self.layer.cornerRadius = 7
        self.layer.borderWidth = 1
        self.layer.borderColor = #colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 0.7992371818)
    }
    
    func addShadow(offSet: CGFloat = 2.0, color: UIColor = .black) {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = CGSize(width: offSet, height: offSet)
        self.layer.shadowOpacity = 1
        self.layer.shouldRasterize = false
        self.layer.masksToBounds = false
    }
    
    func addViewShadow(offSet: CGFloat = 2.0, color: UIColor = .black) {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = CGSize(width: offSet, height: offSet)
        self.layer.shadowOpacity = 1
        self.layer.shouldRasterize = false
        self.layer.masksToBounds = false
    }
    
    func addShadowAllSide(radius: CGFloat = 4.0, color: UIColor = .lightGray) {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = radius
        self.layer.shadowOpacity = 1
        self.layer.shouldRasterize = false
        self.layer.masksToBounds = false
    }
    
    func addBottomShadow(shadowHeight: CGFloat = 5) {
//        self.layer.shadowColor = UIColor.lightGray.cgColor
//        self.layer.shadowOffset = CGSize(width: 0 , height:1)
//        self.layer.shadowOpacity = 1
//        self.layer.shadowRadius = 1
//        self.layer.masksToBounds = false
//
//        self.layer.masksToBounds = false
//        self.layer.shadowRadius = 1
//        self.layer.shadowOpacity = 1
//        self.layer.shadowColor = UIColor.lightGray.cgColor
//        self.layer.shadowOffset = CGSize(width: 0 , height:1)
        
        
        let shadowPath = UIBezierPath()
        
        shadowPath.move(to: CGPoint(x: 0, y: layer.bounds.height))
            shadowPath.addLine(to: CGPoint(x: layer.bounds.width, y: layer.bounds.height))
            shadowPath.addLine(to: CGPoint(x: layer.bounds.width, y: layer.bounds.height + shadowHeight))
            shadowPath.addLine(to: CGPoint(x: 0, y: layer.bounds.height + shadowHeight))
            shadowPath.close()
        
//        shadowPath.move(to: CGPoint(x: layer.bounds.origin.x, y: layer.frame.size.height))
//        shadowPath.addLine(to: CGPoint(x: someView.bounds.width / 2, y: someView.bounds.height + 7.0))
//        shadowPath.addLine(to: CGPoint(x: layer.bounds.width, y: layer.bounds.height))
//        shadowPath.close()

        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.masksToBounds = false
        self.layer.shadowPath = shadowPath.cgPath
        self.layer.shadowRadius = 5
    }
    
    func convertToImage() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.isOpaque, 0.0)
        self.drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        let snapshotImageFromMyView = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return snapshotImageFromMyView!
    }
    
    func applyGradient(isTopBottom: Bool, colorArray: [UIColor]) {
        if let sublayers = layer.sublayers {
            let _ = sublayers.filter({ $0 is CAGradientLayer }).map({ $0.removeFromSuperlayer() })
        }
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colorArray.map({ $0.cgColor })
        if isTopBottom {
            gradientLayer.locations = [0.0, 1.0]
        } else {
            //leftRight
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        }
        
        backgroundColor = .clear
        gradientLayer.frame = self.bounds
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func setGradientBackground(colorOne: UIColor, colorTwo: UIColor, colorThree: UIColor, colorFour: UIColor, colorFive: UIColor, colorSix: UIColor, colorSevemn: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor, colorThree.cgColor, colorFour.cgColor ]
        //gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func addCornerRadius(radius: CGFloat) {
        self.layer.cornerRadius = radius
    }
    
    func addShadowButton(offSet: CGFloat = 1.0, color: UIColor = .black) {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = CGSize(width: offSet, height: offSet)
        self.layer.shadowOpacity = 0.4
        self.layer.masksToBounds = false
    }
    
    func addDashedBorder(with color: UIColor, lineWidth: CGFloat, cornerRadius: CGFloat, patern: [NSNumber]) {
        
        let color = color.cgColor
        
        let shapeLayer:CAShapeLayer = CAShapeLayer()
        let frameSize = self.frame.size
        let shapeRect = CGRect(x: 0, y: 0, width: frameSize.width, height: frameSize.height)
        
        shapeLayer.bounds = shapeRect
        shapeLayer.position = CGPoint(x: frameSize.width/2, y: frameSize.height/2)
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = color
        shapeLayer.lineWidth = lineWidth
        shapeLayer.lineJoin = .round
        shapeLayer.lineDashPattern = patern
        shapeLayer.path = UIBezierPath(roundedRect: shapeRect, cornerRadius: cornerRadius).cgPath
        
        self.layer.addSublayer(shapeLayer)
    }
    
    
    func addTopBorder(with color: UIColor?, andWidth borderWidth: CGFloat) {
        let border = UIView()
        border.backgroundColor = color
        border.autoresizingMask = [.flexibleWidth, .flexibleBottomMargin]
        border.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: borderWidth)
        addSubview(border)
    }
    
    func addBottomBorder(with color: UIColor?, andWidth borderWidth: CGFloat) {
        let border = UIView()
        border.backgroundColor = color
        border.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]
        border.frame = CGRect(x: 0, y: frame.size.height - borderWidth, width: frame.size.width, height: borderWidth)
        addSubview(border)
    }
    
    func addLeftBorder(with color: UIColor?, andWidth borderWidth: CGFloat) {
        let border = UIView()
        border.backgroundColor = color
        border.frame = CGRect(x: 0, y: 0, width: borderWidth, height: frame.size.height)
        border.autoresizingMask = [.flexibleHeight, .flexibleRightMargin]
        addSubview(border)
    }
    
    func addRightBorder(with color: UIColor?, andWidth borderWidth: CGFloat) {
        let border = UIView()
        border.backgroundColor = color
        border.autoresizingMask = [.flexibleHeight, .flexibleLeftMargin]
        border.frame = CGRect(x: frame.size.width - borderWidth, y: 0, width: borderWidth, height: frame.size.height)
        addSubview(border)
    }
}

// MARK: - UIViewController
extension UIViewController {
    internal enum NavigationBarVisibility {
        case show
        case hide
    }
    
    func toggleNavigationBarVisibility(_ visibility: NavigationBarVisibility) {
        switch visibility {
        case .show:
            navigationController?.navigationBar.isHidden = false
        case .hide:
            navigationController?.navigationBar.isHidden = true
        }
    }
    
    func makeNaviagtionBarTransparent() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
    }
}
