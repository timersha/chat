//
//  BubbleImageFabric.swift
//  BubbledMessageImageView
//
//  Created by timersha on 03/05/2017.
//  Copyright © 2017 timersha. All rights reserved.
//

import Foundation
import UIKit

class BubbleImageFabric
{
    static func stretchableRegularBubbleImageWith(isIncoming:Bool) -> UIImage?
    {
        var imageName:String
        if isIncoming
        {
            imageName = "bubbleIncomig"
        }
        else
        {
            imageName = "bubbleOutgoing"
        }
        guard let image  = UIImage(named: imageName) else {return nil}
//        guard let maskedImage = image.maskedImage(color: color) else {return nil}
        let capInsets = image.centerPointEdgeInsets()
        let stretchableImage = image.stretchableImage(capInsets: capInsets)
        
        return stretchableImage
    }

}
