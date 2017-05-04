//
//  InputViewFabric.swift
//  BubbledMessageImageView
//
//  Created by timersha on 03/05/2017.
//  Copyright © 2017 timersha. All rights reserved.
//

import Foundation

class InputViewFabric
{
    class func loadDefaultInputView() -> InputView?
    {
        let bundle = Bundle(for: ViewController.self)
        let arr = bundle.loadNibNamed("InputView",
                                      owner: nil,
                                      options: nil)
        guard let view = arr?.first as? InputView else {return nil}
        return view
    }
}
