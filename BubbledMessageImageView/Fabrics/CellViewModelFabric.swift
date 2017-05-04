//
//  CellViewModelFabric.swift
//  BubbledMessageImageView
//
//  Created by timersha on 04/05/2017.
//  Copyright © 2017 timersha. All rights reserved.
//

import Foundation


class CellViewModelFabric
{
    class func createCellViewModels() -> [CellViewModel]
    {
        var arr = [CellViewModel]()
        for index in 0...9
        {
            arr.append(CellViewModel(text: "message",
                                     isIncomingMessage: index%2 == 0,
                                     reuseId: index%2 == 0 ? "IncomingMessageCell": "OutgoingMessageCell"))
        }
        return arr
    }
    
    class func createCellViewModel(isIncoming:Bool , message:String) -> CellViewModel
    {
        let cellViewModel = CellViewModel(text: message,
                                          isIncomingMessage: isIncoming,
                                          reuseId:isIncoming ? "IncomingMessageCell": "OutgoingMessageCell")
        return cellViewModel
    }
}
