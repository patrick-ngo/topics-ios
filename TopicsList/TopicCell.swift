//
//  TopicCell.swift
//  TopicsList
//
//  Created by Patrick on 4/13/17.
//  Copyright © 2017 Patrick Ngo. All rights reserved.
//

import Foundation
import UIKit

class TopicCell: UITableViewCell
{
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var topicLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var upButton: UIButton!
    @IBOutlet weak var downButton: UIButton!
    
    var delegate:TopicListDelegate?
    

    override func awakeFromNib()
    {
        containerView.roundCorners()
        
        upButton.addTarget(self, action: #selector(upvote), for: .touchUpInside)
        downButton.addTarget(self, action: #selector(downvote), for: .touchUpInside)
    }
    
    func upvote()
    {
        topic?.upvotes += 1
        delegate?.topicDataChanged()
    }
    
    func downvote()
    {
        topic?.upvotes -= 1
        delegate?.topicDataChanged()
    }
    
    var topic:Topic?
    {
        didSet
        {
            topicLabel.text = topic?.topicText
            countLabel.text = String(topic!.count)
            usernameLabel.text = topic?.username
        }
    }
}
