//
//  Utils.swift
//  Sweetiee
//
//  Created by tringuyen on 21/04/2022.
//

import UIKit

struct AppOrientationUtility {

    static func lockOrientation(_ orientation: UIInterfaceOrientationMask) {
        if let delegate = UIApplication.shared.delegate as? AppDelegate {
            delegate.orientationLock = orientation
        }
    }

    static func lockOrientation(_ orientation: UIInterfaceOrientationMask, andRotateTo rotateOrientation:UIInterfaceOrientation) {
        self.lockOrientation(orientation)
        UIDevice.current.setValue(rotateOrientation.rawValue, forKey: "orientation")
        UINavigationController.attemptRotationToDeviceOrientation()
    }

}

//MARK: UILabel extension
extension UILabel {
    func addTextOutline(usingColor outlineColor: UIColor, outlineWidth: CGFloat) {
        class OutlinedText: UILabel{
            var outlineWidth: CGFloat = 0
            var outlineColor: UIColor = .clear

            override public func drawText(in rect: CGRect) {
                let shadowOffset = self.shadowOffset
                let textColor = self.textColor

                let c = UIGraphicsGetCurrentContext()
                c?.setLineWidth(outlineWidth)
                c?.setLineJoin(.round)
                c?.setTextDrawingMode(.stroke)
                self.textAlignment = .center
                self.textColor = outlineColor
                super.drawText(in:rect)

                c?.setTextDrawingMode(.fill)
                self.textColor = textColor
                self.shadowOffset = CGSize(width: 0, height: 0)
                super.drawText(in:rect)

                self.shadowOffset = shadowOffset
            }
        }

        let textOutline = OutlinedText()
        let outlineTag = 9999

        if let prevTextOutline = viewWithTag(outlineTag) {
            prevTextOutline.removeFromSuperview()
        }

        textOutline.outlineColor = outlineColor
        textOutline.outlineWidth = outlineWidth
        textOutline.textColor = textColor
        textOutline.font = font
        textOutline.text = text
        textOutline.tag = outlineTag

        sizeToFit()
        addSubview(textOutline)
        textOutline.frame = CGRect(x: -(outlineWidth / 2), y: -(outlineWidth / 2),
                                   width: bounds.width + outlineWidth,
                                   height: bounds.height + outlineWidth)
    }
}

//MARK: UIFont extension
extension UIFont {
    class func rounded(ofSize size: CGFloat, weight: UIFont.Weight) -> UIFont {
        let systemFont = UIFont.systemFont(ofSize: size, weight: weight)
        let font: UIFont
        
        if let descriptor = systemFont.fontDescriptor.withDesign(.rounded) {
            font = UIFont(descriptor: descriptor, size: size)
        } else {
            font = systemFont
        }
        return font
    }
}

//MARK: Date extension
extension Date {
    static func from(year: Int, month: Int, day: Int) -> Date {
        let calendar = Calendar(identifier: .gregorian)
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        let date = calendar.date(from: dateComponents) ?? Date()
        return date
    }
}
