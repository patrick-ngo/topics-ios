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
        
        //set target actions for up and down buttons
        upButton.addTarget(self, action: #selector(upvote), for: .touchUpInside)
        downButton.addTarget(self, action: #selector(downvote), for: .touchUpInside)
    }
    
    @objc fileprivate func upvote()
    {
        //increment upvote and refresh data
        if let topic = topic
        {
            topic.upvotes += 1
            delegate?.topicDataChanged()
        }
        
    }
    
    @objc fileprivate func downvote()
    {
        //increment downvotes and refresh data
        if let topic = topic
        {
            topic.downvotes += 1
            delegate?.topicDataChanged()
        }
    }
    
    var topic:Topic?
    {
        //after topic set, automatically set corresponding ui
        didSet
        {
            topicLabel.text = topic?.topicText
            usernameLabel.text = topic?.username
            
            if let count = topic?.count
            {
                countLabel.text = String(count)
            }
        }
    }
}
