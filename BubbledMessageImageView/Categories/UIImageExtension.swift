//
//  UIImageExtension.swift
//  BubbledMessageImageView
//
//  Created by timersha on 03/05/2017.
//  Copyright © 2017 timersha. All rights reserved.
//

import Foundation
import UIKit

extension UIImage
{
    func maskedImage(color:UIColor) -> UIImage?
    {
        var image:UIImage?
        let frame = CGRect(x: 0.0, y: 0.0, width: self.size.width, height: self.size.height)
        UIGraphicsBeginImageContextWithOptions(frame.size, false, self.scale)
        guard let context = UIGraphicsGetCurrentContext() else {return nil}
        context.scaleBy(x: 1.0, y: -1.0)
        context.translateBy(x: 0.0, y: -1*frame.size.height)
        guard let cgImage = self.cgImage else {return nil}
        context.clip(to: frame, mask:cgImage)
        context.setFillColor(color.cgColor)
        context.fill(frame)
        image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
    
    func stretchableImage(capInsets:UIEdgeInsets) -> UIImage
    {
        return self.resizableImage(withCapInsets: capInsets, resizingMode: .stretch)
    }
    
    func centerPointEdgeInsets() -> UIEdgeInsets
    {
        let centerPoint = CGPoint(x: self.size.width/2, y: self.size.height/2)
        return UIEdgeInsetsMake(centerPoint.y, centerPoint.x, centerPoint.y, centerPoint.x)
    }
    
    func flippImageHorizontally() -> UIImage?
    {
        guard let cgImage = self.cgImage else {return nil}
        return UIImage(cgImage: cgImage,
                       scale: self.scale,
                       orientation: .upMirrored)
    }
}











