//
//  CellViewModel.swift
//  BubbledMessageImageView
//
//  Created by timersha on 04/05/2017.
//  Copyright © 2017 timersha. All rights reserved.
//

import Foundation

class CellViewModel
{
    var cellReuseId:String
    var cellText:String
    var isIncoming:Bool
    
    init(text:String, isIncomingMessage:Bool, reuseId:String)
    {
        self.cellText = text
        self.isIncoming = isIncomingMessage
        self.cellReuseId = reuseId
    }
    
}
