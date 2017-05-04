//
//  IncomingMessageCell.swift
//  BubbledMessageImageView
//
//  Created by timersha on 04/05/2017.
//  Copyright © 2017 timersha. All rights reserved.
//

import Foundation
import UIKit

class IncomingMessageCell: UITableViewCell,MessageCellProtocol
{
    @IBOutlet weak var bubbleImageView: UIImageView!
    @IBOutlet weak var descrLabel: UILabel!
    var cellModel:CellViewModel?
    {
        didSet
        {
            if let incoming = self.cellModel?.isIncoming
            {
                self.bubbleImageView.image = BubbleImageFabric.stretchableRegularBubbleImageWith(isIncoming:incoming)
            }
            if let text = self.cellModel?.cellText
            {
                self.descrLabel.text = text
            }
        }
    }
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
    }
}
