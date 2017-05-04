//
//  AutoHeightTextView.swift
//  BubbledMessageImageView
//
//  Created by macUser on 04/05/2017.
//  Copyright © 2017 timersha. All rights reserved.
//

import Foundation
import UIKit

class AutoHeightTextView: UITextView
{
    var heightConstraint:NSLayoutConstraint?
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 6.0
    }
}







