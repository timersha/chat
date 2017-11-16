//
//  ViewController.swift
//  BubbledMessageImageView
//
//  Created by timersha on 01/05/2017.
//  Copyright © 2017 timersha. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,InputViewDelegate
{
    @IBOutlet weak var tableView: UITableView!
    var arr = [CellViewModel]()
    var messageInputView: InputView?
    
    override var inputAccessoryView: InputView?
        {
        return messageInputView
    }
    override var canBecomeFirstResponder: Bool
        {
        return true
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.initTableView()
        self.initTableViewDataSource()
        self.initMessageInputView()
        self.subscribeToKeyboardNotifications()
    }
    
    deinit
    {
        NotificationCenter.default.removeObserver(self)
    }
    
    //MARK: UITableViewDataSource
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.arr.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.arr[indexPath.row].cellReuseId,
                                                 for: indexPath) as! MessageCellProtocol
        cell.cellModel = self.arr[indexPath.row]
        return cell as! UITableViewCell
    }
    
    //MARK: InputViewDelegate
    
    func sendMessageButtonDidTap(message:String?)
    {
        guard let text = message else {return}
        self.arr.append(CellViewModelFabric.createCellViewModel(isIncoming: false, message: text))
        self.tableView.reloadData()
        self.scrollTableViewToBottom()
    }
    
    func initMessageInputView()
    {
        self.messageInputView = InputViewFabric.loadDefaultInputView()
        self.messageInputView?.delegate = self
    }
    
    func initTableView()
    {
        self.tableView.estimatedRowHeight = 44.0
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.keyboardDismissMode = .interactive
        self.tableView.separatorStyle = .none
        self.tableView.register(UINib(nibName:"OutgoingMessageCell", bundle:nil), forCellReuseIdentifier: "OutgoingMessageCell")
        self.tableView.register(UINib(nibName:"IncomingMessageCell", bundle:nil), forCellReuseIdentifier: "IncomingMessageCell")
    }
    
    func initTableViewDataSource()
    {
        self.arr = CellViewModelFabric.createCellViewModels()
    }
    
    func subscribeToKeyboardNotifications()
    {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillChangeFrame(notification:)),
                                               name: .UIKeyboardWillChangeFrame,
                                               object: nil)
    }
    
    @objc func keyboardWillChangeFrame(notification:Notification)
    {
        guard let frame  = notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? CGRect else {return}
        guard let animationDuration = notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? CGFloat else {return}
        let timeInterval = TimeInterval(animationDuration)
        let insets = UIEdgeInsetsMake(0.0, 0.0, frame.size.height, 0.0)
        
        UIView.animate(withDuration: timeInterval,
                       animations:
            {
                self.tableView.contentInset = insets
        })
        { (isCompleted) in
            self.scrollTableViewToBottom()
        }
    }
    
    func scrollTableViewToBottom()
    {
        let numberOfSections = self.tableView.numberOfSections
        let numberOfRowsInLastSection = self.tableView.numberOfRows(inSection: numberOfSections-1)
        let indexPath = IndexPath(row: numberOfRowsInLastSection-1, section: numberOfSections-1)
        self.tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
    }
}



























