//
//  InputView.swift
//  BubbledMessageImageView
//
//  Created by timersha on 03/05/2017.
//  Copyright © 2017 timersha. All rights reserved.
//

import UIKit
import Foundation

protocol InputViewDelegate:NSObjectProtocol
{
    func sendMessageButtonDidTap(message:String?)
}

class InputView: UIView, UITextViewDelegate
{
    @IBOutlet weak var sendMessageButton: UIButton!
    @IBOutlet weak var messageTextView: AutoHeightTextView!
    @IBOutlet weak var messageViewHeightConstraint: NSLayoutConstraint!
    weak var delegate:InputViewDelegate?
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        self.messageTextView.delegate = self
    }
    
    @IBAction func sendMessageButtonTap(_ sender: Any)
    {
        self.sendMessage()
    }
    
    //MARK: UITextViewDelegate
    
    func textViewDidChange(_ textView: UITextView)
    {
        let contentSize = textView.sizeThatFits(textView.contentSize)
        self.frame.size.height = self.checkContainerViewMaxAndMin(height:contentSize.height + 10.0)
        self.messageViewHeightConstraint?.constant = self.checkTextViewMaxAndMin(height:self.bounds.size.height - 10.0)
        self.textViewScrollHandling()
        textView.reloadInputViews()
    }

    //MARK: Actions
    
    func sendMessage()
    {
        let string = self.messageTextView.text.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        if string.characters.count > 0
        {
            guard let _ = self.delegate?.sendMessageButtonDidTap(message:) else {return}
            self.delegate?.sendMessageButtonDidTap(message: string)
            self.messageTextView.text = ""
            self.setDefaultHeights()
        }
    }
    
    override func layoutSubviews()
    {
        self.messageViewHeightConstraint?.constant = self.checkTextViewMaxAndMin(height:self.bounds.size.height - 10.0)
        self.textViewScrollHandling()
        super.layoutSubviews()
    }
    
    func setDefaultHeights()
    {
        self.frame.size.height = 44.0
        self.messageViewHeightConstraint?.constant = 34.0
        self.messageTextView.reloadInputViews()
        self.layoutSubviews()
    }
    
    func checkTextViewMaxAndMin(height:CGFloat) -> CGFloat
    {
        var newHeight = height
        newHeight = min(newHeight, 100.0)
        newHeight = max(newHeight, 34.0)
        return newHeight
    }
    
    func checkContainerViewMaxAndMin(height:CGFloat) -> CGFloat
    {
        var newHeight = height
        newHeight = min(newHeight, 110.0)
        newHeight = max(newHeight, 44.0)
        return newHeight
    }
    
    func textViewScrollHandling()
    {
        if (self.messageTextView.sizeThatFits(self.messageTextView.contentSize).height > 100.0 )
        {
            self.messageTextView.isScrollEnabled = true
        }
        else
        {
            self.messageTextView.isScrollEnabled = false
        }
    }
}







