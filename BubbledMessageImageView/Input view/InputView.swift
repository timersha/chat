//
//  InputView.swift
//  BubbledMessageImageView
//
//  Created by timersha on 03/05/2017.
//  Copyright © 2017 timersha. All rights reserved.
//

import Foundation
import UIKit

protocol InputViewDelegate:NSObjectProtocol
{
    func sendMessageButtonDidTap(message:String?)
}

class InputView: UIView, UITextViewDelegate
{
    @IBOutlet weak var sendMessageButton: UIButton!
    @IBOutlet weak var messageTextView: AutoHeightTextView!
    weak var delegate:InputViewDelegate?
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        self.messageTextView.delegate = self
    }
    
    @IBAction func sendMessageButtonTap(_ sender: Any)
    {
        guard let _ = self.delegate?.sendMessageButtonDidTap(message:) else {return}
        let string = self.messageTextView.text.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        self.delegate?.sendMessageButtonDidTap(message: string)
    }
}







